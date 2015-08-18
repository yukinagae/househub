json.array!(@properties) do |property|
  json.extract! property, :id, :name, :price, :population
  json.url property_url(property, format: :json)
end
