class AddUserStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :integer
  end
end
