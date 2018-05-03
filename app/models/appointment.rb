class Appointment < ApplicationRecord
  belongs_to :user, through: :staff
  belongs_to :user, through: :patient
  validates :staff_id, presence: true
  validates :patient_id, presence: true
end
