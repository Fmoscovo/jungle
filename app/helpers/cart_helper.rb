module CartHelper
  def discounted_cart_subtotal_cents(enhanced_cart)
    subtotal = 0
    enhanced_cart.each do |item|
      product = item[:product]
      quantity = item[:quantity].to_i
      subtotal += product.discounted_price.cents * quantity
    end
    subtotal
  end
end

