class Youtube
  attr_accessor :videos , :channels , :playlists
  def initialize
    @client = Yourub::Client.new
  end

  def search_music(query)
    params = {q:query}
    search(params)
  end
  
  def search(params)
    params[:part] = "snippet"
    params[:maxResults] = 10
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
  
  def player_params(id)
  { :id => id,
  :part => 'player'
  }
  end          

  def details(id)
     request = Yourub::REST::Videos.list(@client,player_params(id))
     request.data.items
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
  attr_accessor :image , :id , :title , :item
  def initialize(item)
     @item = item
     @id = item.id
     thumbnails= item.snippet.thumbnails 
     @image = thumbnails.present? ? thumbnails.medium.url : "false"
     @title = item.snippet.title
  end
end
