class Customer < ApplicationRecord
  has_many :orders, dependent: nil

  validates :name, :address, length: { minimum: 4 }
end
