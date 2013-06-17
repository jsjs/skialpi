class StatsController < ApplicationController

	def index
		achievements_order_top10
		season_order_top10
	end

	def best
		achievements_order_all
	end

	def best_in_season
		season_order_all
	end

end
