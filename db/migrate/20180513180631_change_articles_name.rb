class ChangeArticlesName < ActiveRecord::Migration[5.1]
  def change
    rename_table :articles, :news
  end
end
