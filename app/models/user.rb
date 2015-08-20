class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# , :registerable :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
	
	#RELATIONSHIPS
	has_many :attention

	belongs_to :worker
end
