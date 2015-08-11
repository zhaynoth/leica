json.array!(@attention_sws) do |attention_sw|
  json.extract! attention_sw, :id, :issue, :type, :priority, :integer, :comment, :unity_id
  json.url attention_sw_url(attention_sw, format: :json)
end
