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
      #puts "Which headline would you like more information on? Enter the number:"
      #puts ""
      puts "Enter list to see the list again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      end
    end
      puts ""
      puts "Goodbye, enjoy today's games!"
  end
end  
