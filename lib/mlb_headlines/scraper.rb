require "Nokogiri"
require "pry"
require "open-uri"


class MlbHeadlines::Scraper

attr_accessor :doc

  def self.get_page
    doc = Nokogiri::HTML(open("http://www.cbssports.com/fantasy/baseball/players/news/all/both/"))
  end 
  
  def self.scrape_headlines
    @doc.css("ul#playerNewsContent li .row").each do |row|
      Headline.player
      Headline.position_team
      Headline.title
      Headline.description
      Headline.website_url
    end
  end

  def self.make_list
    #self.scrape_headlines.each do |title| 
     # MlbHeadlines::Headline.new_from_index_page(title)
    #end  
    puts "making list works"
  end

end 
