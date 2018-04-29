class Api::V1::OrdersController < ApplicationController
    before_action :find_product
    before_action :find_category, only: [:update, :show, :destroy]

    def index
        orders = @product.orders.all || Order.all
        render json: orders
    end

    def create
        order = @product.orders.new(order_params) || Order.new(order_params)
        if order.save!
          success(I18n.t("success_message.order_success"))
        else
          bad_request(order.errors)
        end
    end

    def update
        if @order.update_attributes(order_params)
          success(I18n.t("success_message.order_success"))
        else
          bad_request(@order.errors)
        end
    end

    def show
        render json: @order
    end

    def destroy
        if @order.destroy
          success(I18n.t("success_message.order_success"))
        else
          bad_request(@order.errors)
        end
    end

    private

    def order_params
        params.require(:order).permit!
    end

    def find_product
        @product = Product.find(params[:product_id])
    end

    def find_category
        @order = @product.orders.find(params[:id]) || Order.find(params[:id])
    end
end