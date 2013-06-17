module StatsHelper

	def achievements_order_top10
		achievements_order(10)
	end

	def season_order_top10
		season_order(10)
	end

	def achievements_order_all
		achievements_order(0)
	end

	def season_order_all
		season_order(0)
	end

	def achievements_order (limit)
		@query = "select u.id, u.name, u.sex, points, rank() over (order by points desc) from (
  					select user_id, sum(points) as points from achievements group by user_id
				  ) t
				  join users u on u.id = t.user_id"

		if limit != 0
			@query = @query + " limit #{limit}"
		end

		@achievements = ActiveRecord::Base.connection.execute(@query)
	end

	def season_order (limit)
		@query = "select u.id, u.name, u.sex, points, rank() over (order by points desc) from (
  					select user_id, sum(points) as points from achievements
  					where date_part('year', date) = date_part('year', current_date)
  					group by user_id
				  ) t
				  join users u on u.id = t.user_id"

		if limit != 0
			@query = @query + " limit #{limit}"
		end

		@season = ActiveRecord::Base.connection.execute(@query)
	end

end
