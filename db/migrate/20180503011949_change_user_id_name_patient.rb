class ChangeUserIdNamePatient < ActiveRecord::Migration[5.1]
  def change
    rename_column :patients, :userId, :user_id
  end
end
