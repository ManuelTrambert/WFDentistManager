class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :phoneNumber
      t.text :allergies
      t.text :note

      t.timestamps
    end
  end
end
