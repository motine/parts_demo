Rails.application.routes.draw do
  get '/start', to: 'default#index'
  root 'default#index'
end
