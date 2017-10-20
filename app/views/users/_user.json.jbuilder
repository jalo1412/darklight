json.extract! user, :id, :name, :Type_of_user_id, :created_at, :updated_at
json.url user_url(user, format: :json)
