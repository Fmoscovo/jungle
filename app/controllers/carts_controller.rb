# app/controllers/carts_controller.rb
class CartsController < ApplicationController

  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_back fallback_location: root_path
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_back fallback_location: root_path
  end

  private

  def modify_cart_delta(product_id, delta)
  puts "Current cart before modification: #{cart.inspect}"
  cart[product_id] = (cart[product_id] || 0) + delta
  cart.delete(product_id) if cart[product_id] < 1
  puts "Current cart after modification: #{cart.inspect}"
  update_cart cart
end

end
