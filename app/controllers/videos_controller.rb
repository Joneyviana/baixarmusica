class VideosController < ApplicationController
  
  def index
  end

  def search
   get_youtube_api
   @youtube_api.search(params[:q])
   @videos = @youtube_api.videos
   render json: {"items":@videos}
  end

  def download 
    begin 
      get_conversor_crawler
      @conversor_crawler.converter_mp3(params[:id])
      render text: @conversor_crawler.link
    rescue
      render text: "problema de conexão" , status: 503
    end
  end

  private
  attr_accessor :youtube_api , :youtube_conversor_crawler
  
  def get_youtube_api
     @youtube_api = Youtube.new unless @youtube_api.present?
  end
  
  def get_conversor_crawler
     @conversor_crawler = YoutubeCrawler.new unless @conversor_crawler.present?
  end

end
