class VideosController < ApplicationController
  
  def index
  end

  def search
   
   youtube_api.search_music(params[:q])
   @videos = youtube_api.videos
   render json: {"items":@videos}
  end

  def download 
      headers['Content-type'] = 'audio/mp3; charset=utf-8'
      headers['Content-Transfer-Encoding'] = 'binary'
      title = params[:title].to_s + ".webm"
      title.delete!(" ")
      options = {username:"someone",password:"password1", format: "171",output:title}
      YoutubeDL.download "https://www.youtube.com/watch?v="+params[:id], options
      send_file(title, :filename => title)

  end

  def client
    @client ||= Yourub::Client.new
  end

  def watch
    @countries = client.countries
    if request.post?
       youtube_api.search(params)
       @videos = youtube_api.videos
      end
  end

  def details
    @details = youtube_api.details(params[:id])
  end


  private
  

  
  def youtube_api
     @youtube_api ||= Youtube.new 
  end
  
  def conversor_crawler
     @conversor_crawler ||= YoutubeCrawler.new 
  end

end
