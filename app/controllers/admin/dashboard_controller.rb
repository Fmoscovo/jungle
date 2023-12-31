# app/controllers/admin/dashboard_controller.rb

class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def show
    @product_count = Product.count
    @category_count = Category.count
    @sales = Sale.all
  end
end
