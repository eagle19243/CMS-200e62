namespace :sync do

  desc "Sync places from places.yml file"
  task :places => :environment do
    require 'yaml'

    Place.destroy_all

    yaml_path = Rails.root.join('places.yml')
    categories = YAML.load_file(yaml_path)
    defaults = categories.delete('defaults') || {}

    puts "Reading places from '#{yaml_path}'"

    categories.each do |name, places|
      accepted, rejected = places.partition {|p| p['address'].present?}

      rejected.each do |place|
        puts "skip: '#{place['name']}' has no address"
      end

      accepted.each do |place|
        place = Place.create(defaults.merge(place).merge(category: name))
        puts "warn: '#{place['name']}' was not located" unless place.lat && place.long
        sleep(0.1)
      end
    end
  end

end
