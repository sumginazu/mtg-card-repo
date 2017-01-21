require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MtgCardRepo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.assets.initialize_on_precompile = false

    # Ensure that mtgjson is downloaded - if not, download it
    mtgjson_file = Rails.root.join('app', 'json', 'mtg.json')
    mtgjson_zip = Rails.root.join('app', 'json', 'mtg.json.zip')
    unless File.exist?(mtgjson_file)
      puts "No MTG JSON file found."
      unless File.exist?(mtgjson_zip)
        puts "Downloading from mtgjson.com..."
        IO.copy_stream(open('http://mtgjson.com/json/AllSets.json.zip'), mtgjson_zip.to_s)
        until File.exist?(mtgjson_zip) do
          sleep 2
        end
      end
      puts "Unzipping MTG JSON file..."
      Zip::File.open(mtgjson_zip) do |zipfile|
        zipfile.each do |f|
          zipfile.extract(f, mtgjson_file)
        end
      end
    end
    puts "Loaded MTG JSON successfully."
  end
end
