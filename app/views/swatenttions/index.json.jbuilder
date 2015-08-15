json.array!(@swatenttions) do |swatenttion|
  json.extract! swatenttion, :id, :issue, :type_id, :priority, :comment, :unity_id, :attention_id
  json.url swatenttion_url(swatenttion, format: :json)
end
