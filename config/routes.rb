Rails.application.routes.draw do
  resources :professors do
      resource :classrooms , only:[:new,:create]
  end
  resources :students do
      post 'check_register_number', on: :collection
      resource :classrooms , only:[:new,:create]

  end
  resources :courses  do
     post 'checkName', on: :collection
  end
  root to: 'students#index'

  

end
