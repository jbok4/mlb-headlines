class MLBHeadlines::CLI

  def call
    MLBHeadlines::Scraper.new.make_headlines
    puts "Up To The Minute MLB Player News–Get It While It's Hot!"
    start
  end  

  def start
    print_headlines(input)

    puts ""
    puts "Which headline would you like more information on?"
    input = gets.strip

    headline = MLBHeadlines::Headline.find(input.to_i)

    print_headline(headline)

    puts ""
    puts "Would you like to see another story? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thankyou! Have a great day!"
      exit
    end    
  end

  def print_headline(headline)
    puts ""
    puts "----------- #{headline.player} - #{headline.position_team} -----------"
    puts ""
    puts "Title:              #{headline.title}"
    puts "Time of Article:    #{headline.time}"
    puts "Link:               #{headline.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{headline.description}"
    puts ""
  end

  def print_headlines(from_number)
    puts ""
    puts "---------- Headlines #{from_number} - #{from_number+9} ----------"
    puts ""
    MLBHeadlines::Headline.all[from_number-1, 10].each.with_index(from_number) do |headline, index|
      puts "#{index}. #{headline.player} - #{headline.position_team} - #{headline.title}"
    end  
  end 

end  
