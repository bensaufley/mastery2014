class CreateUserActivities < ActiveRecord::Migration
  def change
    create_join_table :users, :activities, table_name: :user_activities do |t|
      t.index :user_id
      t.index :activity_id
      t.index [:user_id, :activity_id], unique: true
    end
  end
end
