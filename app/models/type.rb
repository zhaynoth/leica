class Type < ActiveRecord::Base
	has_many :worker, dependent: :destroy
	
	#VALIDATIONS
	validates_presence_of :campo
	validates_presence_of :valor	

end
