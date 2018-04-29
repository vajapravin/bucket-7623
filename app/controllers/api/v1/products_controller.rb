class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:update, :show, :destroy]

  def index
    products = @user.products.all || Product.all
    render json: categories
  end

  def create
    product = @user.products.new(product_params) || Product.new(product_params)
    if product.save!
      success(I18n.t("success_message.product_success"))
    else
      bad_request(product.errors)
    end
  end

  def update
    if @product.update_attributes(product_params)
      success(I18n.t("success_message.product_success"))
    else
      bad_request(@product.errors)
    end
  end

  def show
    render json: @product
  end

  def destroy
    if @product.destroy
      success(I18n.t("success_message.product_success"))
    else
      bad_request(@product.errors)
    end
  end

  private

  def product_params
    params.require(:product).permit!
  end

  def find_product
    @product = Product.find(params[:id])
  end
end