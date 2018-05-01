class Article < ApplicationRecord
  has_many :image
  belongs_to :page
end
