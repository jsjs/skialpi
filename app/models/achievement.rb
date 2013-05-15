class Achievement < ActiveRecord::Base
  attr_accessible :date, :note, :time, :track_id
  
  include TracksHelper
    
  belongs_to :user
  belongs_to :track
  
  validates :user_id, presence: true
  validates :track_id, presence: true
  
  before_save :count_points
  
  # default_scope order: "date DESC"
  
  def count_points
    self.points = difficulty_level_points(track.difficulty) + exposure_level_points(track.exposure)
  end
  
end
