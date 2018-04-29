# == Schema Information
#
# Table name: inventories
#
#  id            :integer          not null, primary key
#  initial_qty   :integer
#  initial_price :float
#  current_qty   :integer
#  current_price :float
#  product_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Inventory < ApplicationRecord
  belongs_to :product
end
