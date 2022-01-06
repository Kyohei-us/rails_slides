Rails.application.routes.draw do
  root 'pages#home'
  get '/myBookmarks', to: "pages#myBookmarks"
  get '/myTrackNotes', to: "pages#myTrackNotes"
  devise_for :users
  resources :bookmarks
  resources :track_notes
  resources :music_tracks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
