class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :orders

  def self.search(search, category)
    if !search.to_s.strip.empty? && !category.to_s.strip.empty?
      # where(name: search)
      where(["name LIKE ? and category_id= ?", "%#{search}%",
             Category.where(name: category).first.id])
    elsif !search.to_s.strip.empty?
      where(["name LIKE ?", "%#{search}%"])

    elsif !category.to_s.strip.empty?
      where(category_id: Category.where(name: category).first.id)
    else
      all
    end
  end
end
