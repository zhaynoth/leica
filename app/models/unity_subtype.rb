class UnitySubtype < ActiveRecord::Base
	#RELATIONSHIPS
	has_many :unity
	belongs_to :unity_type

	#VALIDATIONS
	validates_presence_of :subtype
	validates_presence_of :unity_types_id
end
