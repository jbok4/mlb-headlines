class MlbHeadlines::CLI

  def call
    puts "Up To The Minute MLB Player News–Get It While It's Hot!"
    start
  end  

  def list
    puts ""
    puts "---------- Latest MLB Headlines ----------"
    puts ""
    MlbHeadlines::Headline.all.each.with_index(1) do |headline, index|
      puts "#{index}. #{headline.player} - #{headline.position_team} - #{headline.title}"
    end
    puts ""
  end

  def print_article(article)
    puts ""
    puts "-------------- #{article.player} - #{article.position_team} - #{article.title} --------------"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts article.description
    puts ""

    puts "Time: #{article.time}"
    puts "Link: #{article.website_url}"
    puts ""
  end

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "Which headline would you like more information on? Enter the number:"
      puts ""
      puts "Enter list to see the list again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if article = MlbHeadlines::Headline.find_by_name(input)
          print_article(article)
        end
      elsif input.to_i > 0
        if article = MlbHeadlines::Headline.find(input.to_i)
          print_article(article)
        end
      end
    end
      puts ""
      puts "Goodbye, enjoy today's games!"
  end



end  



