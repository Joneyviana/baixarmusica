require "rails_helper"

def test_list()
  items.each do |item|
    yield item
  end
end
describe "search videos youtube" do

  before(:all) do
    @youtube = Youtube.new
    @youtube.search("armandinho")
    end

  let(:videos){@youtube.videos}
  let(:channels){@youtube.channels}
  let(:playlists){@youtube.playlists}
  let(:items){videos+channels+playlists}
  let(:first){items.first}

  it "count of videos equal to 7" do
    expect(items.size).to eq(10)
  end
  it "video has id" do
    test_list { |item| expect(item.id).to be }
  
  end
  it "video has title" do
    test_list { |item| expect(first.title).to be }
  end
  it "video has url-image" do
    test_list { |item| expect(first.image).to be }
  end
   it "video should will be converter to json" do
      expect(videos.to_json).to eq(10)
  end
end
