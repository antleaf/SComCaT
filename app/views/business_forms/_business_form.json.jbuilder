json.extract! business_form, :id, :name, :description, :slug, :notes, :created_at, :updated_at
json.url business_form_url(business_form, format: :json)
