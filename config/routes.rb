Rails.application.routes.draw do
  root 'movies#search'
  post 'movies/search', to: 'movies#create'
  resources :movies
end
