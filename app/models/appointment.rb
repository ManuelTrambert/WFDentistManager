class Appointment < ApplicationRecord
  belongs_to :staff
  belongs_to :patient
  validates :staff_id, presence: true
  validates :patient_id, presence: true
end
