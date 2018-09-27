Rails.application.routes.draw do
  resources :plants, only: %i[index]
end
