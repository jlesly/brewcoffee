Rails.application.routes.draw do
  
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  get 'auth/failure', to: redirect('/')

  resources :users do 
    resources :brews
  end 
  resources :brews do 
    resources :comments
  end 

  resources :equipment
  resources :comments
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
