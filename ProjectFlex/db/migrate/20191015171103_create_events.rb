class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.integer :point_value
      t.string :point_type

      t.timestamps
    end
  end
end
