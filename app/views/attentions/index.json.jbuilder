json.array!(@attentions) do |attention|
  json.extract! attention, :id, :reportby, :dateinc, :datefin, :type_id, :horas, :horashombre, :contract_id
  json.url attention_url(attention, format: :json)
end
