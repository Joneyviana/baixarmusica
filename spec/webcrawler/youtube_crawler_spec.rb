require "rails_helper"

describe "acessando video download mp3" do

  before do
    @crawler = YoutubeCrawler.new
    
    end

  let(:link){@crawler.link}
  
  it "should have link" do
    @crawler.converter_mp3("RBSIwDlyk6U")
    expect(link).to include("video_id")
  end

 
end
