# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :name, :description, :access, :conditions
  
  validates :name, presence: true, length: { maximum: 150 }
  
  has_many :areas, dependent: :destroy
  
  default_scope order: :name
  
end
