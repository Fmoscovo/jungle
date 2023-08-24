# app/controllers/admin/sales_controller.rb
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

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to admin_sales_path, notice: 'Sale was successfully deleted.'
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sale_params)
      redirect_to admin_sales_path, notice: 'Sale was successfully updated.'
    else
      render :edit
    end
  end


  private

  def sale_params
    params.require(:sale).permit(:name, :percent_off, :start_on, :end_on)
  end

  def ensure_admin
    # Here, check if the user is admin; if not, redirect them with a warning
  end
end
