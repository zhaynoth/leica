class Unity < ActiveRecord::Base
	#RELATIONSHIPS
	has_many :swatenttion
	belongs_to :unity_subtype
	belongs_to :project 
end
