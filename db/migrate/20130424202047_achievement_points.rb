class AchievementPoints < ActiveRecord::Migration
  def change
    add_column :achievements, :points, :integer
  end
end
