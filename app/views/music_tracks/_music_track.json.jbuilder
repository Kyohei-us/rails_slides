json.extract! music_track, :id, :name, :spotifyURI, :created_at, :updated_at
json.url music_track_url(music_track, format: :json)
