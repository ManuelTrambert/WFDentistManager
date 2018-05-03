class ChangeStaffIdAndPatientIdName < ActiveRecord::Migration[5.1]
  def change
    rename_column :appointments, :doctorId, :staff_id
    rename_column :appointments, :patientId, :patient_id
    add_index :appointments, [:staff_id]
    add_index :appointments, [:patient_id]
    add_index :patients, [:user_id]
  end
end
