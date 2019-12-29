# frozen_string_literal: true

class Pokemon < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :number, presence: true
  has_many  :types
end

class Type < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
end
