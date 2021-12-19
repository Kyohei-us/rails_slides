json.extract! bookmark, :id, :name, :url, :user_id, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
