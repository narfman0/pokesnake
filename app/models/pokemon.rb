class Pokemon < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :number, presence: true
end
