# frozen_string_literal: true

class Pokemon < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :number, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  has_and_belongs_to_many :types
end
