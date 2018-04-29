class Api::V1::CategoriesController < ApplicationController
  before_action :find_product
  before_action :find_category, only: [:update, :show, :destroy]

  def index
    categories = @product.categories.all || Category.all
    render json: categories
  end

  def create
    category = @product.categories.new(category_params) || Category.new(category_params)
    if category.save!
      success(I18n.t("success_message.category_success"))
    else
      bad_request(category.errors)
    end
  end

  def update
    if @category.update_attributes(category_params)
      success(I18n.t("success_message.category_success"))
    else
      bad_request(@category.errors)
    end
  end

  def show
    render json: @category
  end

  def destroy
    if @category.destroy
      success(I18n.t("success_message.category_success"))
    else
      bad_request(@category.errors)
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_category
    @category = @product.categories.find(params[:id]) || Category.find(params[:id])
  end
end
