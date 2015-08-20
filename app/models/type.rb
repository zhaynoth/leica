class Type < ActiveRecord::Base
	has_many :worker
	
	#VALIDATIONS
	validates_presence_of :campo
	validates_presence_of :valor	

end
