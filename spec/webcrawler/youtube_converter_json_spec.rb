require "rails_helper"



describe "access to json api youtube converter" do

  before do
    @crawler = YoutubeConverterJson.new("xuiaL9HD2hw")
  end
  
  it "should have pushitem id" do
   expect(@crawler.pushitem.body).to eq("xuiaL9HD2hw")
  end

 it "should have item info" do
   expect(@crawler.info).to  be_kind_of(Hash)
 end
 
 it "returns correct link formed" do
    expect(@crawler.link).to include(YOUTUBE_MP3)
    
 end
end

