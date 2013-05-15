class Area < ActiveRecord::Base

  attr_accessible :description, :name
  
  belongs_to :location
  has_many :tracks, dependent: :nullify
  
  validates :name, presence: true, length: { maximum: 150 }
  validates :location_id, presence: true
  
  default_scope order: :name
  
end
