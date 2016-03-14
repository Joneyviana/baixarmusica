Rails.application.routes.draw do

  get "/search", to: "videos#search"
  get "/download", to: "videos#download"

  root to: "videos#index"
end
