require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  setup do
    @item = items(:one)
  end
  
  test "quantity should be strictly greater than 0" do
    @item.quantity = -1
    assert_not @item.valid?
    @item.quantity = 0
    assert_not @item.valid?
  end
end
