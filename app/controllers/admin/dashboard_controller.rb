class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'] , password: ENV['AUTH_PASSWORD']

  def show
    @total_products = Product.count
    @total_category = Category.count
  end
end
