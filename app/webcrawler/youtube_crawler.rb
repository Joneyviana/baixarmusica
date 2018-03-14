#Capybara.current_driver = :poltergeist
class YoutubeCrawler < PoltergeistCrawler
  attr_accessor :link

  def initialize
    super
    visit "https://y2mate.com"
  end

  def converter_mp3(id)
  
    fill_in "query", with: "https://www.youtube.com/watch?v="+id
    click_on "Start"
    click_on('Link Text')
    @link = node[:href]
    
  end

end
