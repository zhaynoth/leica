json.array!(@workers) do |worker|
  json.extract! worker, :id, :nombre, :apellido, :cargo_types_id, :fotocheck, :telefono, :email
  json.url worker_url(worker, format: :json)
end
