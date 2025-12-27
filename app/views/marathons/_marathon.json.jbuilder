json.extract! marathon, :id, :name, :course, :max_capacity, :entry_start, :entry_end, :created_at, :updated_at
json.url marathon_url(marathon, format: :json)
