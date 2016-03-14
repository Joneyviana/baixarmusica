require 'capybara/poltergeist'
require 'capybara/dsl'

class PoltergeistCrawler
  include Capybara::DSL

  def initialize
    Capybara.current_driver = :poltergeist
    page.driver.headers = {
     "DNT" => 1}
  end
end
