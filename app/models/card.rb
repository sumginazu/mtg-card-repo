require 'net/http'
require 'zip'

class Card < ApplicationRecord
  has_many :card_instances
  has_many :users, through: :card_instances

  serialize :names, Array
  serialize :colors, Array
  serialize :color_identity, Array
  serialize :supertypes, Array
  serialize :types, Array
  serialize :subtypes, Array
  serialize :variations, Array
  serialize :rulings, Array
  serialize :foreign_names, Array
  serialize :printings, Array
  serialize :legalities, Array

  def Card.complete_hash
    @json ||= JSON.parse(File.read('db/source/mtg.json'))
    @_complete_hash ||= (@json.map {|name, json| [name, parse(json)]}).to_h
  end

  def Card.reset_hash
    @json = nil
    @_complete_hash = nil
  end

  def Card.create_from_name name
    unless name.present? && complete_hash.keys.include?(name)
      raise Exceptions::NoSuchCardException
    end
    Card.new(complete_hash[name])
  end

  # Takes a hash representing a JSON string representing a card and turns it
  # into a hash that can be used to instantiate a new Card object.
  # JSON must follow the format defined by mtgjson.com.
  def Card.parse json
    json['type_line'] = json.delete('type') # rails is picky
    json.delete('release_date') if json['release_date'].try(:count, '-').to_i < 2 # ignore unless full date
    json['release_date'] = json['release_date'].try(:to_date) # pre-parse
    json.each_with_object({}) do |kv, o| # use snake case
      key, value = kv
      o[key.to_s.underscore.to_sym] = value
    end
  end

  def Card.fetch_json_from_source
    source_url = 'https://mtgjson.com/json/AllCards-x.json.zip'
    dest_zip = Rails.root.join('db', 'source', 'mtg.json.zip')
    dest_json = Rails.root.join('db', 'source', 'mtg.json')
    puts "Deleting old source data..."
    File.delete(dest_zip) if File.exist? dest_zip
    File.delete(dest_json) if File.exist? dest_json
    puts "Downloading from mtgjson.com..."
    IO.copy_stream(open(source_url), dest_zip.to_s)
    c = 0
    until File.exist?(dest_zip) || c > 10 do
      sleep 2
      c += 1
    end
    puts "Unzipping MTG JSON file..."
    Zip::File.open(dest_zip) do |zipfile|
      zipfile.extract(zipfile.first, dest_json)
    end
    puts "Download complete."
  end

  def Card.update_db options={}
    fetch_json_from_source if options[:refresh_source]
    reset_hash
    keys = options[:cards] || complete_hash.keys
    keys.each do |name|
      card = Card.find_by_name name
      if card.present?
        card.update(complete_hash[name])
      else
        card = Card.create_from_name name
      end
      card.save!
      puts name
    end
  end
end
