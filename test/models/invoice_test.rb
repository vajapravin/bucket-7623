# == Schema Information
#
# Table name: invoices
#
#  id               :integer          not null, primary key
#  total            :float
#  serial_no        :string
#  ship_cost        :float
#  unit_cost        :float
#  shipping_address :string
#  shipping_zip     :integer
#  shipping_state   :string
#  shipping_flat    :string
#  shipping_country :string
#  contact_person   :string
#  contact_phone    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
