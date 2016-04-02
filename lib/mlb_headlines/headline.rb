class MLBHeadlines::Headline

  #attr_accessor :player, :position_team, :title, :time, :website_url, :food_style, :description, :url

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("h2").text, 
      "http://www.theworlds50best.com#{r.css("a").attribute("href").text}",
      r.css("h3").text,
      r.css(".position").text
      )
  end

  def initialize(player=nil, url=nil, title=nil, position_team=nil)
    @player = player
    @url = url
    @title = title
    @position_team = position_team
    @@all << self
  end

  def self.all
    @@all
  end 

  def self.find(id)
    self.all[id-1]
  end

  def player
    @player ||= doc.xpath("//*[@id="playerNewsContent"]/li[1]/div/div[1]/div/div/div[2]/div/p/a").text
  end  
  
  def position_team
    @position_team ||= doc.xpath("//*[@id="playerNewsContent"]/li[1]/div/div[1]/div/div/div[2]/div/p/span").text
  end 

  def title
    @title ||= doc.xpath("//*[@id="playerNewsContent"]/li[1]/div").text
  end    

  def time
    @time ||= doc.xpath("//*[@id="playerNewsContent"]/li[1]/div/div[2]/div/time").text
  end

  def website_url
    @website_url ||= doc.xpath("//*[@id="globalWrapper"]/main/div[3]/div/div[2]/section[1]/div/div/section[1]/ul/li/div/div/ul/li[1]/a").text
  end 

  def description
    @description ||= doc.xpath("//*[@id="playerNewsContent"]/li[1]/div/div[2]/div/div/p[1]" + "//*[@id="playerNewsContent"]/li[1]/div/div[2]/div/div/p[2]").text
  end  

  def doc 
    @doc ||= Nokogiri::HTML(open(self.url))
  end 
end 
