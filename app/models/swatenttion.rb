class Swatenttion < ActiveRecord::Base
	#RELATIONSHIPS
	belongs_to :attention
	belongs_to :unity
	belongs_to :type

	#VALIDATIONS
	validates_presence_of :issue
	validates_presence_of :type_id
	validates_presence_of :priority
	validates_presence_of :comment
	validates_presence_of :unity_id
	#validates_presence_of :attention_id

	#METHODS

	#set attention.id to swattention.attention_id
	def set_attention_id=(att_id)
		self.attention_id = att_id
	end

	def get_responsible
		self.attention.involved.where(:rol => 'responsable').worker.nombre
  	end

end
