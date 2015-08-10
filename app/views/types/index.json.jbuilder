json.array!(@types) do |type|
  json.extract! type, :id, :campo, :valor
  json.url type_url(type, format: :json)
end
