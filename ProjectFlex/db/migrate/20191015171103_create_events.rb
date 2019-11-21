class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.integer :point_value, default: 1
      t.string :point_type
      t.string :location
<<<<<<< HEAD
      t.string :details
      t.integer :max_signups
      t.integer :current_signups
      t.boolean :mandatory
=======
      t.string :details, default: ""
      t.integer :current_signups, default: 0
      t.integer :max_signups, default: 0
      t.boolean :mandatory, default: false

>>>>>>> 33b2fe2b25590bcaebc9f76a43174baa92b324b3
      t.timestamps
    end
  end
end
