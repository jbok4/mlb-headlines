class MlbHeadlines::CLI

  def call
    puts ""
    puts "Up To The Minute MLB Player News–Get It While It's Hot!"
    start
  end  

  def list
    puts ""
    puts "---------- Latest MLB Headlines ----------"
    puts ""
    MlbHeadlines::Headline.all.each.with_index(1) do |headline, index|
      puts "#{index}. #{headline.title}"
    end
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
      puts "Enter refresh to refresh the list"
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i.between?(1,10) == true
        intro
        puts MlbHeadlines::Headline.all[input.to_i-1].article
      elsif input == "refresh"
        MlbHeadlines::Headline.destroy
        MlbHeadlines::Headline.all
        list
      elsif input == "exit"
        sleep 1
        puts "Goodbye, enjoy today's games!"
      else 
        puts "Sorry, that is not a valid command"
        sleep 1
        list
      end
    end
  end 

  def intro
    puts ""
    puts "---------- More Information ----------"
    puts ""
  end



end 