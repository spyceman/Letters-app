Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/letters', to: 'letters#create'

  post '/statistics', to: 'statistics#show'
  get '/statistics', to: 'statistics#index'
end
