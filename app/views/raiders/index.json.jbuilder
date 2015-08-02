json.array!(@raiders) do |raider|
  json.extract! raider, :id, :name, :lastName, :rut, :acceptedTerms
  json.url raider_url(raider, format: :json)
end
