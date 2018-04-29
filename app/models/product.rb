# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  unit        :string
#  sku         :string
#  supplier    :string
#  discount    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories
    has_many :orders

    accepts_nested_attributes_for :categories, reject_if: :blank
end
