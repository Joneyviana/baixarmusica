class VideosController < ApplicationController
  
  def index
  end

  def search
   
   youtube_api.search_music(params[:q])
   @videos = youtube_api.videos
   render json: {"items":@videos}
  end

  def download 
    begin 
      headers['Content-type'] = 'audio/mp3; charset=utf-8'
      headers['Content-Transfer-Encoding'] = 'binary'
      title = params[:title].to_s
      title.delete!(" ")
      puts title
      headers["Content-disposition"] = "attachment; filename="+title+".mp3"
      conversor_crawler.converter_mp3(params[:id])
    rescue
      render text: "problema de conexão" , status: 503
    end
     request = Typhoeus::Request.new(conversor_crawler.link, followlocation: true)
      
      self.response_body = Enumerator.new do |y|
        request.on_body do |response|
          y << response
        end
       request.run()
    end
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
