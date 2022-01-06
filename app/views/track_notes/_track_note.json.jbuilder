json.extract! track_note, :id, :music_track_id, :body, :user_id, :created_at, :updated_at
json.url track_note_url(track_note, format: :json)
