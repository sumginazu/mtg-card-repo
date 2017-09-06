class Card < ApplicationRecord
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
end
