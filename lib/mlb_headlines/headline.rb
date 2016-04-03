class MlbHeadlines::Headline

  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc

  #def self.new_from_index_page(title)
   # self.new(
   #   title.css("h4").text, 
    #  "http://www.cbssports.com/fantasy/baseball/news/#{title.css("a").attribute("href").text}",
    #  title.css("h3").text,
    #  title.css(".position").text
    #  )
  #end

  #def initialize(player=nil, website_url=nil, title=nil, position_team=nil, time=nil, description=nil)
   # @player = player
  #  @website_url = website_url
   # @title = title
   # @position_team = position_team
   # @time = time
   # @description = description
   # @@all << self
  #end

  #def self.all
  #  @@all
  #end 

  #def self.find(id)
  #  self.all[id-1]
  #end

  def player #works
    @player = @doc.css(".players-annotated p a").text.strip
  end  
  
  def website_url #works
    @website_url = @doc.css(".player-news-desc a").attribute("href").value
  end 

  def title #works
    @title = @doc.css(".player-news-desc a").text.strip
  end    

  def position_team #works
    @position_team = @doc.css(".players-annotated p span").text
  end 

  def time #works
    @time = @doc.css(".eyebrow").text.strip
  end

  def description #works
    @description = @doc.css(".latest-updates p").text.strip
  end  

  #def doc 
   # @doc ||= Nokogiri::HTML(open(self.url))
  #end 

end 
