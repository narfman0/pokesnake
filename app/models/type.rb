# frozen_string_literal: true

class Type < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  has_and_belongs_to_many :pokemon
end
