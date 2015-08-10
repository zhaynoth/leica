json.array!(@contracts) do |contract|
  json.extract! contract, :id, :nombre, :project_id
  json.url contract_url(contract, format: :json)
end
