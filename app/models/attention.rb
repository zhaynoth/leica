class Attention < ActiveRecord::Base
	#RELATIONSHIPS
	has_many :involved, dependent: :destroy 
	has_many :worker, through: :involved 

	belongs_to :type
	belongs_to :contract
	belongs_to :user

	has_one :swatenttion, dependent: :destroy 

	#VALIDATIONS
	validates_presence_of :reportby
	validates_presence_of :dateinc
	validates_presence_of :datefin
	validates_presence_of :type_id
#	validates_presence_of :horas
#	validates_presence_of :horashombre
	validates_presence_of :contract_id

	#METHODS
	before_save :set_hours
	before_save :set_report
	after_create :save_involved

	#calculate hours and man hours
	def nro_involved=(cant)
		@involved = cant		
	end
	def set_hours
		seg = self.datefin - self.dateinc
		mm = seg/60
		hh = mm/60
		self.horas = hh	
		self.horashombre = hh * @involved
	end

	#save repor status before save
	def set_report
		self.report = 'open'
	end

	#save relationships with workers (save_involved)
	def participants=(value)
		@participants = value	
	end
	def responsible=(value)
		@responsible = value
	end
	def save_involved
		#save responsible worker
		Involved.create(worker_id: @responsible, attention_id: self.id, rol: "responsable" )

		#save participants worker
		if @participants != nil
			@participants.each do |p|
			Involved.create(worker_id: p, attention_id: self.id, rol: "participante" )
			end
		end
	end

	def attention_saved
		@attention_saved = self
	end
end