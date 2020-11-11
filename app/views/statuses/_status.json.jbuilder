json.extract! status, :id, :name, :description, :created_at, :updated_at
json.url status_url(status, format: :json)
