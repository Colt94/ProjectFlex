class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.integer :point_value, default: 1
      t.string :point_type
      t.string :location
      t.string :details, default: ""
      t.integer :current_signups, default: 0
      t.integer :max_signups, default: 0
      t.boolean :mandatory, default: false

      t.timestamps
    end
  end
end
