require "api/v1/application_controller"
module Api::V1

  class SalesController < ApplicationController
    before_action :set_sale, only: [:show, :update, :destroy]

    def index
      @sales = Sale.all
      @today_sales_count = Sale.today_sales_count
      @this_week_sales_count = Sale.this_week_sales_count
      @this_week_sales = Sale.this_week_sales.group_by_day_of_week(:created_at).count
    end

    def show
    end

    def create
      product = Product.find(params[:product_id])
      @sale = product.sales.build(sale_params)

      if @sale.save
        render @sale, status: :created, location: @sale
      else
        render json: @sale.errors, status: :unprocessable_entity
      end
    end

    def update
      if @sale.update(sale_params)
        render @sale
      else
        render json: @sale.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @sale.destroy
    end

    private
      def set_sale
        @sale = Sale.find(params[:id])
      end

      def sale_params
        params.require(:sale).permit(:product_id, :amount, :quantity, :total)
      end
  end


end
