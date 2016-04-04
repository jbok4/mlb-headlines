class MlbHeadlines::Headline

  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc

  def list_news(articles)
    puts ""
    puts "---------- Latest MLB Headlines ----------"
    puts ""
    articles.each_with_index do |headline, index|
      puts "#{index+1}. #{headline[:player]} - #{headline[:position_team]} - #{headline[:title]}"
    end
  end

  def headline_list
    list_news(articles)
  end

  def print_story(articles, input)
    puts ""
    puts "----------- #{articles[input-1][:player]} - #{articles[input-1][:position_team]} -----------"
    puts ""
    puts "Title:              #{articles[input-1][:title]}"
    puts "Time:               #{articles[input-1][:time]}"
    puts "Link:               #{articles[input-1][:website_url]}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{articles[input-1][:description]}"
    puts ""
  end

end 



  #def player #works
  #  @player = @doc.css(".players-annotated p a").text.strip
  #end  
  
  #def website_url #works
  #  @website_url = @doc.css(".player-news-desc a").attribute("href").value
  #end 

  #def title #works
  #  @title = @doc.css(".player-news-desc a").text.strip
  #end    

  #def position_team #works
  #  @position_team = @doc.css(".players-annotated p span").text
  #end 

  #def time #works
   # @time = @doc.css(".eyebrow").text.strip
  #end

  #def description #works
  #  @description = @doc.css(".latest-updates p").text.strip
  #end  

  #def doc 
   # @doc ||= Nokogiri::HTML(open(self.url))
  #end 


