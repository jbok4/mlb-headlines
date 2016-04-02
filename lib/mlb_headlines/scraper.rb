class MLBHeadlines::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.cbssports.com/fantasy/baseball/players/news/all/both/"))
  end 
  
  def scrape_headlines
    self.get_page.css(".col-8 li")
  end

  def make_list
    scrape_headlines.each do |title| 
      MLBHeadlines::Headline.new_from_index_page(r)
    end  
  end
end 
