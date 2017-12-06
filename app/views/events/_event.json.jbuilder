json.extract! event, :id, :title, :link, :category, :description, :date, :weekday, :date, :time, :location, :other, :created_at, :updated_at
json.url event_url(event, format: :json)
