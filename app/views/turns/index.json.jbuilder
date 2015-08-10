json.array!(@turns) do |turn|
  json.extract! turn, :id, :turno, :contract_id
  json.url turn_url(turn, format: :json)
end
