require_relative '../../app/services/suumo_scraper'
require_relative '../../app/models/property'

begin
    properties = SuumoScraper.scrape_properties
    properties.each do |property|
        Property.create!(
            title: property[:title],
            rent: property[:rent],
            administration: property[:administration]
        )
    end
rescue => e
    e
end
