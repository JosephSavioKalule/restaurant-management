class Table < ApplicationRecord
  validates :number_of_places, numericality: true
  validates :number_of_places, numericality: { greater_than: 0 }
  
  has_many :orders
end
