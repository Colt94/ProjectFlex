class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :zone
      t.string :permissions, default: "Member"
      t.string :net_id
      t.timestamps
    end
  end
end
