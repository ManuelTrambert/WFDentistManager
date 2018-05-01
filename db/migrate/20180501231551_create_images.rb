class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :articleId
      t.string :fileName

      t.timestamps
    end
  end
end
