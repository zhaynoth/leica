class Contract < ActiveRecord::Base
	#RELATIONSHIPS
	#has_and_belongs_to_many :worker
	has_many :contract_worker
	has_many :worker, through: :contract_worker                                                                                                                                                                                                                                                                                                                                                       , dependent: :destroy	
	belongs_to :project	

	#VALIDATIONS
	validates_presence_of :nombre
	validates_presence_of :project_id

	#METHODS

end