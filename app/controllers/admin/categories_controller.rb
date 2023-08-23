# app/controllers/admin/categories_controller.rb

class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
end
