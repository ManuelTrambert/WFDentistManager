class AddPhoneNumberToStaff < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :phoneNumber, :string
  end
end
