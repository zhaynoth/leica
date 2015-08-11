json.array!(@unity_subtypes) do |unity_subtype|
  json.extract! unity_subtype, :id, :subtype, :unity_type_id
  json.url unity_subtype_url(unity_subtype, format: :json)
end
