class Worker < ActiveRecord::Base
	#RELATIONSHIPS
	has_many :contract_worker  
	has_many :contract, through: :contract_worker

	has_many :involved
	has_many :attention, through: :involved

	has_one :user

	belongs_to :type

	#VALIDATIONS
	validates_presence_of :nombre
	validates_presence_of :apellido
	validates_presence_of :type_id
	validates_presence_of :fotocheck
	validates_presence_of :telefono
	validates_presence_of :email 

	#METHODS

 	#checks to see whether a given worker is assigned in a specified contract 
 	#the include? method of contract check whether aparticular contract is included in the list
 	def assigned_in?(contract)
 		self.contract.include?(contract)
	end

  	#returns the list of contracts that a worker is not yet enrolled
  	def unassigned_contracts
  		Contract.all - self.contract  		
  	end

end
