class MlbHeadlines::CLI

  def call
    MlbHeadlines::Scraper.scrape
    puts "Up To The Minute MLB Player News–Get It While It's Hot!"
    start
  end  

  def start
    MlbHeadlines::Headline.list_news(articles)
    puts ""
    puts "Which headline would you like more information on? Enter the number:"
    input = gets.strip.to_i

    print_story(articles, input)

    puts ""
    puts "Would you like to see another story? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Goodbye, enjoy today's games!"
    end    
  end

  


end  
