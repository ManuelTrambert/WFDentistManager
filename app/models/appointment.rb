class Appointment < ApplicationRecord
  belongs_to :staff
  belongs_to :patient
end
