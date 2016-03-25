require 'mechanize'

YOUTUBE_MP3 = "http://www.youtube-mp3.org/get?"

YOUTUBE = "https://www.youtube.com/watch?v="

class YoutubeConverterJson
  attr_accessor :pushitem , :info , :link
  def initialize(id)
    @id = id
    header
    
    @pushitem = @agent.get('http://www.youtube-mp3.org/a/pushItem/',push_items_params)
    info = @agent.get('http://www.youtube-mp3.org/a/itemInfo/',items_info_params)
    index = info.body.index("{")
    @info = JSON.parse(info.body[index..-2])
    
    musica_download
    end
    
  def header()
  	@agent = Mechanize.new
    @agent.robots = false
    @agent.user_agent_alias = 'Mac Safari'
  end 

  def push_items_params
    {item:YOUTUBE+@id, 
     el:'na', 
     bf:'false', 
     r:'1458041495670',
     s:'14014' }
  end
  def items_info_params
    {video_id:@id , 
     ac:'www',
     t:"grp",
     r:"1458036855435", 
     s:"97808"} 

  end  
  
  def prepare_dict
  	{video_id: @id ,
    ts_create:@info["ts_create"], 
    r: @info["r"],
    h2:@info['h2'],  
    s: push_items_params()[:s]
    } 
  end
  
  def musica_download
    @link = YOUTUBE_MP3 + prepare_dict.to_query
  end	
end
