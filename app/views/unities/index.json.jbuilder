json.array!(@unities) do |unity|
  json.extract! unity, :id, :unity, :unity_subtype_id
  json.url unity_url(unity, format: :json)
end
