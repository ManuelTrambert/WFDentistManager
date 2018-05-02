class AddIndexToStaff < ActiveRecord::Migration[5.1]
  def change
    add_index :staffs, [:user_id]
  end
end
