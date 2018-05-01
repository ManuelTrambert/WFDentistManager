class AddDefaultValueToMultipleColumn < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column :users, :type, :integer, :default => 0
    end
  end
end
