json.extract! log, :id, :symptom_id, :severity, :created_at, :updated_at
json.url log_url(log, format: :json)
