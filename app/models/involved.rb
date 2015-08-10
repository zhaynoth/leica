class Involved < ActiveRecord::Base
  #RELATIONSHIPS
  belongs_to :worker
  belongs_to :attention

  #VALIDATIONS
  validates_presence_of :worker_id
  validates_presence_of :attention_id
  validates_presence_of :rol
end
