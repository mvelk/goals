class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :scope
      t.string :status
      t.string :title
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
