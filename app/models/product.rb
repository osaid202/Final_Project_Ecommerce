class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :orders

  def self.search(search)
    if search
       where(["name LIKE ?", "%#{search}%"])
      #where(name: search)
    else
      all
    end
  end
end
