require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @table = tables(:one)
  end
  
  test "table should have at least one place" do
    @table.number_of_places = 0
    assert_not @table.valid?
  end
end
