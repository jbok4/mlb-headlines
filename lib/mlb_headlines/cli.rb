class MlbHeadlines::CLI

  def call
    MlbHeadlines::Scraper.make_list
    puts "Up To The Minute MLB Player News–Get It While It's Hot!"
    start
  end  

  def start
    print_headlines
    puts ""
    puts "Which headline would you like more information on?"
    input = gets.strip

    headline = MlbHeadlines::Headline.find(input.to_i)

    print_story(headline)

    puts ""
    puts "Would you like to see another story? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Enjoy today's games!"
      #exit
    end    
  end

  def print_story(headline)
    puts ""
    puts "----------- #{headline.player} - #{headline.position_team} -----------"
    puts ""
    puts "Title:              #{headline.title}"
    puts "Time:               #{headline.time}"
    puts "Link:               #{headline.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{headline.description}"
    puts ""
  end

  def print_headlines
    puts ""
    puts "---------- Latest MLB Headlines ----------"
    puts ""
    MlbHeadlines::Headline.all.each.with_index(input) do |headline, index|
      puts "#{index}. #{headline.player} - #{headline.position_team} - #{headline.title}"
    end  
  end 

end  
