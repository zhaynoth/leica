json.array!(@projects) do |project|
  json.extract! project, :id, :nombre, :ubicacion
  json.url project_url(project, format: :json)
end
