class Fk < ActiveRecord::Migration
  def change
    add_foreign_key "areas", "locations", :name => "areas_location_id_fk"
    add_foreign_key "bug_reports", "users", :name => "bug_reports_user_id_fk"
    add_foreign_key "tracks", "areas", :name => "tracks_area_id_fk"
  end
end
