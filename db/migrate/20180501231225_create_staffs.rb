class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.integer :status
      t.string :dentalNumber
      t.boolean :isActive

      t.timestamps
    end
  end
end
