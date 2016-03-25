require 'capybara/poltergeist'
require 'capybara/dsl'

class PoltergeistCrawler
  include Capybara::DSL

  def initialize
    Capybara.current_driver = :poltergeist
     page.driver.headers = {                       
      "DNT" => 1,                                 
      "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0"
    }
  end
end
