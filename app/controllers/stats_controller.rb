class StatsController < ApplicationController

	def index
		@achievements = Achievement.select("user_id, u.name, u.sex, sum(points) as sum_points").joins("JOIN users AS u on u.id = user_id").group("user_id, u.name, u.sex").order("sum_points DESC").limit(10)

		@season = Achievement.select("user_id, u.name, u.sex, sum(points) as sum_points").joins("JOIN users AS u on u.id = user_id").group("user_id, u.name, u.sex").where("date_part('year', date) = date_part('year', current_date)").order("sum_points DESC").limit(10)
	end

	def best
		@achievements = Achievement.select("user_id, u.name, u.sex, sum(points) as sum_points").joins("JOIN users AS u on u.id = user_id").group("user_id, u.name, u.sex").order("sum_points DESC").paginate(page: params[:page])
	end

	def best_in_season
		@achievements = Achievement.select("user_id, u.name, u.sex, sum(points) as sum_points").joins("JOIN users AS u on u.id = user_id").group("user_id, u.name, u.sex").where("date_part('year', date) = date_part('year', current_date)").order("sum_points DESC").paginate(page: params[:page])
	end

end
