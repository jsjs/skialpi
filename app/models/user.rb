# encoding: utf-8

# == Schema Information
#
# Table name: users
# encoding: utf-8

#
#  id              :integer          not null, primary key
#  email           :string(255)
#  sex             :string(255)
#  show_email      :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  password_digest :string(255)
#  about           :text
#  name            :string(255)
#  birthdate       :date
#  show_age        :boolean
#

class User < ActiveRecord::Base
  
  attr_accessible :email, :sex, :show_email, :password, :password_confirmation,
                  :about, :name, :birthdate, :show_age
  
  has_secure_password
  
  has_many :bug_reports, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :tracks, through: :achievements
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  #validations
  validates :name, presence: true, length: { maximum: 60 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :sex, presence: true,
                  format: { with: /[mf]/ }
  VALID_DATE_REGEX = /[0-9]{4}-[0-9]{2}-[0-9]{2}/
  validates :birthdate, presence: true,
                        format: { with: VALID_DATE_REGEX }
  
  def create_achievement(track, date, time, note)
    self.achievements.create!(track_id: track.id, date: date, time: time, note: note)
  end
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
  def achievements_ordered
    self.achievements.includes(:track).order("date DESC")
  end
  
  def season_achievements
    self.achievements.where("date_part('year', date) = date_part('year', current_date)").includes(:track).order("date DESC")
  end
  
  def top10_achievements
    self.achievements.select("*").where("date_part('year', date) = date_part('year', current_date)").order("points DESC").limit(10)
  end
  
  def top10_points
    @a = self.top10_achievements
    top10_points_p @a
  end
  
  def top10_points_p(ttachv)
    @a = ttachv
    @sum = 0
    @a.each do |a|
      @sum += a.points
    end
    @sum
  end
  
  def sex_sk
    return "muž" if self.sex.eql?("m")
    return "žena" if self.sex.eql?("f")
  end

  # google:
  def age
    now = Time.now.utc.to_date
    birthday = birthdate.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  
end
