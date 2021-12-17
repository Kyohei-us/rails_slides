json.extract! slide, :id, :name, :user_id, :slideId, :url, :created_at, :updated_at
json.url slide_url(slide, format: :json)
