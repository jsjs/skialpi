class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :sex
      t.boolean :show_email

      t.timestamps
    end
  end
end
