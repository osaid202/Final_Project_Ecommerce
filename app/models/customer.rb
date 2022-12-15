class Customer < ApplicationRecord
  has_many :orders, dependent: nil
end
