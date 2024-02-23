require 'nokogiri'
require 'open-uri'
# require 'logger'

class SuumoScraper
  # 千住大橋駅｜上限10万円｜2K・2DK・2LDK｜2階以上住戸｜ガスコンロ対応｜シューズボックス
  SCRAPING_URL = 'https://suumo.jp/jj/chintai/ichiran/FR301FC001/?ar=030&bs=040&fw2=&pc=20&po1=25&po2=99&ra=013&rn=0555&ek=055521440&md=05&md=06&md=07&cb=0.0&ct=10.0&et=9999999&mb=0&mt=9999999&cn=9999999&tc=0400101&tc=0400201&tc=0400702&shkr1=03&shkr2=03&shkr3=03&shkr4=03'

  def self.scrape_properties
    # logger = Logger.new(STDOUT)
    doc = Nokogiri::HTML(URI.open(SCRAPING_URL))
    properties = []

    doc.css('.cassetteitem').each do |item|
      # logger.info "Fetched page content: #{item.to_html}..."
      title = item.css('.cassetteitem_content-title').text.strip
      rents = item.css('.cassetteitem_price--rent').text.strip.split('万円')
      administrations = item.css('.cassetteitem_price--administration').text.strip.split('円')
      
      for i in 0..(rents.size - 1) do
        rent = rents[i].to_f * 10000
        administration = 0
        if !administrations[i].nil?
          administration = administrations[i].include?("-") ? 0 : administrations[i].to_i
        end
        
        if rent + administration > 100000
          next
        end
        properties << { title: title, rent: rent, administration: administration }
      end
    end

    properties
  end
end
