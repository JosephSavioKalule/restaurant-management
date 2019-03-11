class Item < ApplicationRecord
  belongs_to :order
  belongs_to :edible
  
  validates :quantity, numericality: { greater_than: 0 }
end
