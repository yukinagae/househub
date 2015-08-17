json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :email, :regist_date
  json.url user_url(user, format: :json)
end
