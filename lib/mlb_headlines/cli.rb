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
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input == "1"
        list_articles1
      elsif input == "2"
        list_articles2
      elsif input == "3"
        list_articles3
      elsif input == "4"
        list_articles4
      elsif input == "5"
        list_articles5
      elsif input == "6"
        list_articles6
      elsif input == "7"
        list_articles7
      elsif input == "8"
        list_articles8
      elsif input == "9"
        list_articles9
      elsif input == "10"
        list_articles10
      end
    end
    puts "Goodbye, enjoy today's games!"
  end 


  def list_articles1
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[0..1].join(" ")
    puts ""
  end

  def list_articles2
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[2..3].join(" ")
    puts ""
  end

  def list_articles3
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[4..5].join(" ")
    puts ""
  end

  def list_articles4
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[6..7].join(" ")
    puts ""
  end

  def list_articles5
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[8..9].join(" ")
    puts ""
  end

  def list_articles6
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[10..11].join(" ")
    puts ""
  end

  def list_articles7
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[12..13].join(" ")
    puts ""
  end

  def list_articles8
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[14..15].join(" ")
    puts ""
  end

  def list_articles9
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[16..17].join(" ")
    puts ""
  end

  def list_articles10
    puts ""
    puts "---------- More Information ----------"
    puts ""
    paragraphs = []
    MlbHeadlines::Scraper.all.each do |headline|
      paragraphs << headline.title.strip
    end
    print paragraphs[18..19].join(" ")
    puts ""
  end
 

end 