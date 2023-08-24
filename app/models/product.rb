# app/models/product.rb
class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def discounted_price
    active_sale = Sale.currently_active
    if active_sale
      price * (1 - active_sale.percentage / 100)
    else
      price
    end
  end

end
