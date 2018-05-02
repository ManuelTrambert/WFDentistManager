class Staff < ApplicationRecord
  belongs_to :user, required: false
  has_many :appointment
end
