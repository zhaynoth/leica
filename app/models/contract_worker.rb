class ContractWorker < ActiveRecord::Base
  #RELATIONSHIPS
  belongs_to :contract
  belongs_to :worker

  #VALIDATIONS
  validates_presence_of :contract_id
  validates_presence_of :worker_id
end
