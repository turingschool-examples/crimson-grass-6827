class Supermarket < ApplicationRecord
  has_many :items

  validates :name, presence: true
  validates :location, presence: true
end
