class ChangeTypeVarKey < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :userId, :integer
    add_column :patients, :userId, :integer
  end
end
