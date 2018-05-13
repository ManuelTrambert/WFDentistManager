class AddTitleToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :title, :string
  end
end
