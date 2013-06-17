class Userpop < ActiveRecord::Migration

	def change
    	add_column :users, :helpers, :boolean, default: true
  	end

end
