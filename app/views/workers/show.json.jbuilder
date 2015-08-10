json.extract! @flag, :msaje

json.extract! @contract_worker, :id, :contract_id, :estado

json.contract do
	json.contract_nombre @contract.nombre
end

json.project do
	json.project_nombre @project.nombre
end