class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, dependent: :destroy

end