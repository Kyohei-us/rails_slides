Rails.application.routes.draw do
  resources :user_profiles
  root 'pages#home'
  get '/myBookmarks', to: "pages#myBookmarks"
  get '/myTrackNotes', to: "pages#myTrackNotes"
  get '/lastfmcallback', to: "pages#home"
  get '/trackInfo', to: "pages#trackInfo"
  devise_for :users
  resources :bookmarks
  resources :track_notes
  resources :music_tracks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
