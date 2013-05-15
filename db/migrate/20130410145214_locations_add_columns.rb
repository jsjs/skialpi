class LocationsAddColumns < ActiveRecord::Migration
  def change
    add_column :locations, :description, :text
    add_column :locations, :conditions, :text
    add_column :locations, :access, :text
  end
end
