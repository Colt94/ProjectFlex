class CreateEventAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendances do |t|
      t.string :user_id
      t.integer :event_id
      t.string :status, default: "unapproved"

      t.timestamps
    end
  end
end
