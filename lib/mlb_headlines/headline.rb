class MlbHeadlines::Headline

  attr_accessor :title, :article


  def initialize(title = nil, article = nil)
    @title = title
    @article = article
  end

  def self.all
    @@all ||= MlbHeadlines::Scraper.scrape
  end


  def self.destroy
    @@all = nil
  end

end