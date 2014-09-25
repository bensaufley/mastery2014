class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :type

      t.timestamps
      t.index [:name, :type], unique: true
    end
  end
end
