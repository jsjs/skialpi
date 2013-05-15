class UsersAddBirthdate < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :date
    add_column :users, :show_age, :boolean
  end
end
