require 'test_helper'

class EdibleTest < ActiveSupport::TestCase
  setup do
    @edible = edibles(:one)
  end
  
  test "edible name should be present and not be blank" do
    @edible.name = ''
    assert_not @edible.valid?
    @edible.name = '  '
    assert_not @edible.valid?
  end
  
  test "edible description should be present and not be blank" do
    @edible.description = ''
    assert_not @edible.valid?
    @edible.description = '  '
    assert_not @edible.valid?
  end
  
  test "edible price should be present" do
    @edible.price = nil
    assert_not @edible.valid?
  end
  
  test "edible price should be strictly greater than 0" do
    @edible.price = -2
    assert_not @edible.valid?
    @edible.price = 0
    assert_not @edible.valid?
  end
end
