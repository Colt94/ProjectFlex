class AddNetIdField < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :net_id, :string)
  end
end
