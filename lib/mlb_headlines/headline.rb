require "Nokogiri"
require "pry"
require "open-uri"

class MlbHeadlines::Headline

  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc, :articles

def initialize(title = nil, url = nil)
    @title = title
    @url = url
  end

  def self.all
    #print self.scrape_headlines
       @@all ||= self.scrape_headlines
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_player(player)
    self.all.detect do |m|
      m.player.downcase.strip == player.downcase.strip ||
      m.player.split("(").first.strip.downcase == player.downcase.strip
    end
  end

  def description
    @description ||= @doc.css(".latest-updates p").text.strip
  end

  def player
    @player ||= @doc.css(".players-annotated p a").text.strip
  end

  def position_team 
   @position_team ||= @doc.css(".players-annotated p span").text
  end 

  def time 
    @time ||= @doc.css(".eyebrow").text.strip
  end

  private
    def self.scrape_headlines
      @doc = Nokogiri::HTML(open('http://www.cbssports.com/fantasy/baseball/players/news/all/both/'))
      title = []
      @doc.css(".player-news-desc a").each do |node|        
      title.push new(node.text.strip, node.a("href"))
      end
      title
    end
  
    def doc
      @doc ||= Nokogiri::HTML(open('http://www.cbssports.com/fantasy/baseball/players/news/all/both/'))
    end

end 
