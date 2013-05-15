class StaticPagesController < ApplicationController

  def home
  	@achievements = Achievement.select("user_id, u.name, u.sex, sum(points) as sum_points").joins("JOIN users AS u on u.id = user_id").group("user_id, u.name, u.sex").order("sum_points DESC").limit(3)
	@season = Achievement.select("user_id, u.name, u.sex, sum(points) as sum_points").joins("JOIN users AS u on u.id = user_id").group("user_id, u.name, u.sex").where("date_part('year', date) = date_part('year', current_date)").order("sum_points DESC").limit(3)
  end

  def about
  end
  
  def contact
  end
  
  def help
  end
  
end
