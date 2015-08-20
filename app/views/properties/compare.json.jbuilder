json.array!(@properties) do |property|
  json.extract! property, :id, :name, :price, :population, :state, :region, :town, :kind, :description
  json.url property_url(property, format: :json)
end
