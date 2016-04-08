=begin 
require "Nokogiri"
require "pry"
require "open-uri"

class MlbHeadlines::Scraper
  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc, :articles




  def scrape
    doc = Nokogiri::HTML(open("http://www.cbssports.com/fantasy/baseball/players/news/all/both/"))
    @articles = [{},{},{},{},{},{},{},{},{},{}]
  
    #get players names
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".players-annotated p a").each_with_index do |z, index|
        @articles[index][:player] = z.text.strip
      end

    #get players team and position
    doc.css(".players-annotated p span").each do |z, index|
       @articles[index][:position_team] = z.text.strip
      end

    #get title
    doc.css(".player-news-desc a").each do |z, index|
       @articles[index][:title] = z.text.strip
      end

    #get description
    doc.css(".latest-updates p").each do |z, index|
       @articles[index][:description] = z.text.strip
      end
  @articles
  end

end 
=end