class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, length: { minimum: 4 }
end
