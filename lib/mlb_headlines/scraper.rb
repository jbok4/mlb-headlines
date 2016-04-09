require "Nokogiri"
require "pry"
require "open-uri"

class MlbHeadlines::Scraper

  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc, :articles, :article


  def initialize(title = nil, article = nil)
    @title = title
    @article = article
  end

  def self.all
    @@all ||= self.scrape_headlines
  end

  def self.scrape_headlines
    @doc = Nokogiri::HTML(open('http://www.cbssports.com/fantasy/baseball/players/news/all/both/'))
    title = []
    @doc.css(".latest-updates p").each do |node|         
    title.push new(node.text.strip)
    end
    title
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open('http://www.cbssports.com/fantasy/baseball/players/news/all/both/'))
  end

end