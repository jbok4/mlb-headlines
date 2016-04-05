class MlbHeadlines::Headline

  attr_accessor :player, :position_team, :title, :time, :website_url, :description, :url, :doc, :articles


  def list_news(@@articles)
    puts ""
    puts "---------- Latest MLB Headlines ----------"
    puts ""
    @@articles.each_with_index do |headline, index|
      puts "#{index+1}. #{headline[:player]} - #{headline[:position_team]} - #{headline[:title]}"
    end
  end

  def headline_list
    list_news(@@articles)
  end

  def print_story(@@articles, input)
    puts ""
    puts "----------- #{@@articles[input][:player]} - #{@@articles[input][:position_team]} -----------"
    puts ""
    puts "Title:              #{@@articles[input][:title]}"
    puts "Time:               #{@@articles[input][:time]}"
    puts "Link:               #{@@articles[input][:website_url]}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{@@articles[input][:description]}"
    puts ""
  end

end 



