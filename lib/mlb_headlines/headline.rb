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
    print scrape_headlines
       @@all ||= scrape_headlines
   end
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
      title ||= @doc.css(".player-news-desc a").text.strip
    end
  
    def doc
      @doc ||= Nokogiri::HTML(open('http://www.cbssports.com/fantasy/baseball/players/news/all/both/'))
    end

end 

=begin
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
    @@all ||= scrape
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_player(player)
    self.all.detect do |m|
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  def summary
    @summary ||= plot_summary_doc.search("p.plotSummary").text.strip
  end

  def stars
    @stars ||= doc.search("div[itemprop='actors'] span[itemprop='name']").collect{|e| e.text.strip}.join(", ")
  end

  private
    def self.scrape
      doc = Nokogiri::HTML(open('http://www.cbssports.com/fantasy/baseball/players/news/all/both/'))
      title = doc.search("player-news-desc[h4='title'] a[h4='url']")
      titles.collect{|title| new(title.text.strip, "http://imdb.com#{title.attr("href").split("?").first.strip}")}
    end



     #doc = Nokogiri::HTML(open("http://www.cbssports.com/fantasy/baseball/players/news/all/both/"))
      names = doc.search("h4[itemprop='name'] a[itemprop='url']")
      names.collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
    players = doc.css("ul#playerNewsContent li .row").each do |row|
     row.css(".players-annotated p a").each_with_index do |z, index|
      player = z.text.strip
      end
    end
   end

    def scrape
    doc = Nokogiri::HTML(open("http://www.cbssports.com/fantasy/baseball/players/news/all/both/"))

    #get players names
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".players-annotated p a").each_with_index do |z, index|
        player = z.text.strip
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

    #get description
    doc.css("ul#playerNewsContent li .row").each do |row|
      row.css(".latest-updates p").each do |z, index|
       @articles[index][:description] = z.text.strip
      end
    end

  @articles
  end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end 

=end

