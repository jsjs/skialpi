class Fk2 < ActiveRecord::Migration
  def change
    add_foreign_key "achievements", "tracks", :name => "achievements_track_id_fk"
    add_foreign_key "achievements", "users", :name => "achievements_user_id_fk"
  end
end
