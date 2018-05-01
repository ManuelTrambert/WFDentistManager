class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :doctorId
      t.integer :patientId
      t.datetime :timeSpent
      t.integer :price
      t.text :note

      t.timestamps
    end
  end
end
