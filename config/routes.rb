Rails.application.routes.draw do

  get "/search", to: "videos#search"
  get "/download", to: "videos#download"
  post "/watch", to: "videos#watch"
  get "/watch", to: "videos#watch"
  get "/details", to: "videos#details"
  root to: "videos#index"
end
