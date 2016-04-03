require "Nokogiri"
require "pry"
require "open-uri"


class MlbHeadlines::Scraper

  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc

  def self.get_page
    doc = Nokogiri::HTML(open("http://www.cbssports.com/fantasy/baseball/players/news/all/both/"))
    @articles = [{},{},{},{},{},{},{},{},{},{},{}]
  end 
  
  def self.scrape_headlines
    #get players names
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".players-annotated p a").each_with_index do |z, index|
        @articles[index][:player] = z.text.strip
      end
    end
    #get players team and position
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".players-annotated p span").each do |z, index|
       @articles[index][:position_team] = z.text.strip
      end
    end
    #get title
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".player-news-desc a").each do |z, index|
       @articles[index][:title] = z.text.strip
      end
    end
      #Headline.player
      #Headline.position_team
      #Headline.title
      #Headline.description
      #Headline.website_url
  end

  def self.make_list
    #self.scrape_headlines.each do |title| 
     # MlbHeadlines::Headline.new_from_index_page(title)
    #end  
    puts "making list works"
  end

end 
