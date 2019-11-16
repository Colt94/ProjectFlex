class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.integer :point_value, default: 1
      t.string :point_type
      t.string :location
      t.string :details
      t.integer :max_signups
      t.integer :current_signups
      t.boolean :mandatory
      t.timestamps
    end
  end
end
