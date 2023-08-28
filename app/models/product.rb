class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  # Because you're using monetize, you should validate price_cents, not price
  validates :price_cents, presence: true, numericality: { greater_than: 0 }


  def discounted_price
    active_sale = Sale.currently_active
    if active_sale
      price * (1 - active_sale.percent_off / 100.0)
    else
      price
    end
  end
end
