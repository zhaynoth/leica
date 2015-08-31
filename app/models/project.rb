class Project < ActiveRecord::Base
	#RELATIONSHIPS
	has_many :contract, dependent: :destroy
	has_many :unity

	#VALIDATIONS
	validates_presence_of :nombre
	validates_presence_of :ubicacion
	
	#METHODS
	
end
