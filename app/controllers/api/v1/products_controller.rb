require "api/v1/application_controller"
module Api::V1

  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    def index
      @products = Product.all
      this_week = Time.zone.now.beginning_of_week..Time.zone.now.end_of_week
      @new_arrivals = Product.where(created_at: this_week).or(Product.where(updated_at: this_week))
      @out_of_stock = Product.out_of_stock
    end

    def show
      render json: @product
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
    end

    private
      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :unit_price, :quantity, :x, :y, :height, :width, :image)
      end
  end


end
