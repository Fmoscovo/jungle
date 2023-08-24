class Admin::SalesController < ApplicationController
  # Ensure that this is accessible only to admin users
  before_action :ensure_admin

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to admin_sales_path, notice: 'Sale was successfully created.'
    else
      render :new
    end
  end

  # continue adding actions like edit, update, and destroy later

  private

  def sale_params
    params.require(:sale).permit(:name, :percent_off, :starts_on, :ends_on)
  end

  def ensure_admin
    # Here, check if the user is admin; if not, redirect them with a warning

  end
end
