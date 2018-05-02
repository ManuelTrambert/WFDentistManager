class ChangeUserIdNameAndType < ActiveRecord::Migration[5.1]
  def change
    rename_column :staffs, :userId, :user_id
  end
end
