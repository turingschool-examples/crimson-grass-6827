class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customers

  validates :name, presence: true
  validates :price, presence: true
end
