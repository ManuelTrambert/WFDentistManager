class Staff < ApplicationRecord
  belongs_to :user
  has_many :appointment
  validates :user_id, presence: true
end
