class Youtube
  attr_accessor :videos , :channels , :playlists
  def initialize
    @client = Yourub::Client.new
  end

  def search(query)
    params = {q:query ,  maxResults:10, part:"snippet"}
    @search = Yourub::REST::Search.list(@client, params)
    save_result
  end

  def items
    @search.data.items
  end
  def save_result
    @videos = Array.new
    @channels = Array.new
    @playlists = Array.new
    items.each do |item|
      separate_results item
    end
  end
  def separate_results(item) 
     if item.id.kind.include?("playlist")
       @playlists << YoutubeItem.new(item)
     
     elsif item.id.kind.include?("channel")
       @channels << YoutubeItem.new(item)
     
     else
       @videos << YoutubeItem.new(item)
    end
  end
end

class YoutubeItem
  attr_accessor :image , :id , :title
  def initialize(item)
     @id = item.id
     @image = item.snippet.thumbnails.medium.url
     @title = item.snippet.title
  end
end
