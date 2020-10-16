json.extract! status, :id, :name, :description, :slug, :notes, :created_at, :updated_at
json.url status_url(status, format: :json)
