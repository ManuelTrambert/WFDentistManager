class AddDefaultValueToType < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :type, :integer, default: 0, null: false
  end
end
