class Order < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :products

  accepts_nested_attributes_for :products, :customer, allow_destroy: true
  # , length: { minimum: 2 }  , uniqueness: true
  validates :taxes, :grandTotal, :quantity, numericality: true
end
