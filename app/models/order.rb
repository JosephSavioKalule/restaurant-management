class Order < ApplicationRecord
  belongs_to :table
  has_many :items, dependent: :destroy
end
