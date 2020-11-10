json.extract! collection, :id, :name, :description, :notes, :slug, :created_at, :updated_at
json.url collection_url(collection, format: :json)
