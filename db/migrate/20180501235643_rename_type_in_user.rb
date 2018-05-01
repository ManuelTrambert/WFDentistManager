class RenameTypeInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :type, :status
  end
end
