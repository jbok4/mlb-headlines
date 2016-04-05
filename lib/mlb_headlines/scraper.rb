require "Nokogiri"
require "pry"
require "open-uri"
require_relative './headline.rb'

class MlbHeadlines::Scraper

  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc, :articles

  @@articles = [{},{},{},{},{},{},{},{},{},{}]

  def self.scrape
    doc = Nokogiri::HTML(open("http://www.cbssports.com/fantasy/baseball/players/news/all/both/"))
    
  
    #get players names
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".players-annotated p a").each_with_index do |z, index|
        @@articles[index][:player] = z.text.strip
      end
    end
    #get players team and position
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".players-annotated p span").each do |z, index|
       @@articles[index][:position_team] = z.text.strip
      end
    end

    #get title
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".player-news-desc a").each do |z, index|
       @@articles[index][:title] = z.text.strip
      end
    end

    #get description
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".latest-updates p").each do |z, index|
       @@articles[index][:description] = z.text.strip
      end
    end

    #@@articles
  end


end 
