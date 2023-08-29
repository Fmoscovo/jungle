# app/controllers/orders_controller.rb
class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def discounted_cart_subtotal_cents(cart)
    subtotal = 0.0
    cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      subtotal += (product.discounted_price * quantity) # Assuming product has a discounted_price attribute
    end
    (subtotal * 100).to_i # Convert to cents and ensure it's an integer
  end

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source: params[:stripeToken],
      amount: discounted_cart_subtotal_cents(enhanced_cart),
      description: "Khurram Virani's Jungle Order",
      currency: 'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents, # Make sure this method also returns cents as integer
      stripe_charge_id: stripe_charge.id # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: (product.discounted_price * 100).to_i, # Assuming this also needs to be in cents
        total_price: (product.discounted_price * quantity * 100).to_i
      )
    end
    order.save!
    order
  end

end
