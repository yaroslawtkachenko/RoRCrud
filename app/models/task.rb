class Task < ApplicationRecord
  belongs_to :user
  validates :name, length: { minimum: 3 }
  validates :description, length: { minimum: 7 }
  enum :importance => [:high, :middle, :low]
end
