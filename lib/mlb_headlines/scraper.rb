class MlbHeadlines::Scraper

  attr_accessor :title, :article


  def self.scrape
    @doc = Nokogiri::HTML(open('http://www.cbssports.com/fantasy/baseball/players/news/all/both/'))
    @doc.css("ul#playerNewsContent li").map do |headline|
      title = headline.css("h4").text
      article = headline.css(".latest-updates p").map(&:text).join(" ")
      MlbHeadlines::Headline.new(title, article)
    end
  end


end