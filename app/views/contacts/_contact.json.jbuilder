json.extract! contact, :id, :phone, :street, :street2, :state, :country, :zipcode, :fax, :created_at, :updated_at
json.url contact_url(contact, format: :json)
