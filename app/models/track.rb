# encoding: utf-8
class Track < ActiveRecord::Base
  attr_accessible :altitude, :description, :difficulty, :name, :note, :slope, :exposure, :area_id
  
  belongs_to :area
  has_many :users, through: :achievements
  has_many :achievements, dependent: :destroy
  
  validates :slope, presence: true
  validates :difficulty, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :exposure, presence: true
  validates :area_id, presence: true
 
  validates_numericality_of :altitude, message: "- výška musí byť číslo"
  
  default_scope order: :name  
    
end
