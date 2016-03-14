#Capybara.current_driver = :poltergeist
class YoutubeCrawler < PoltergeistCrawler
  attr_accessor :link

  def initialize
    super
    visit "http://www.youtube-mp3.org/pt"
  end

  def converter_mp3(id)
  
    fill_in "youtube-url", with: "https://www.youtube.com/watch?v="+id
    click_on "Converter Video"
    node = find_link("Download")
    @link = node[:href]
    
  end

end
