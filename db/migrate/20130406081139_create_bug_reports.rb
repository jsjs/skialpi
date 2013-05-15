class CreateBugReports < ActiveRecord::Migration
  def change
    create_table :bug_reports do |t|
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
