json.array!(@guards) do |guard|
  json.extract! guard, :id, :guardia, :contract_id
  json.url guard_url(guard, format: :json)
end
