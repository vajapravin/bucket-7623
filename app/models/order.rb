# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  status     :integer
#  invoice_id :integer
#  product_id :integer
#  user_id    :integer
#  qty        :integer
#  total_cost :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  belongs_to :user

  enum status: %w(waiting on_the_way delivered)

  before_create :set_status

  private
  def set_status
      self.status = 'waiting'
  end
end
