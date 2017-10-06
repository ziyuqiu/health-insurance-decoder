json.extract! contact, :id, :phone_number, :email, :address, :created_at, :updated_at
json.url contact_url(contact, format: :json)
