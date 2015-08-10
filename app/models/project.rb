class Project < ActiveRecord::Base
	#RELATIONSHIPS
	has_many :contract, dependent: :destroy
	validates_presence_of :nombre
	validates_presence_of :ubicacion

	#VALIDATIONS
	
	#METHODS
	
end
