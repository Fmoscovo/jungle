# app/controllers/products_controller.rb
class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @active_sale = Sale.currently_active
  end

  def show
    @product = Product.find params[:id]
  end

end
