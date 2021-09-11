require "api/v1/application_controller"
module Api::V1
  class DashboardController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    def index
      @products = Product.all
      @out_of_stock = Product.out_of_stock
      @today_sales_count = Sale.today_sales_count
      @this_week_sales_count = Sale.this_week_sales_count
    end

  end
end
