require 'test_helper'

class EdiblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edible = edibles(:one)
  end
  
  test "should get edibles index" do
    get edibles_path
    assert_response :success
  end

  test "should get show" do
    get edible_path(@edible)
    assert_response :success
  end

  test "should get new" do
    get new_edible_path
    assert_response :success
  end

  test "should get edit" do
    get edit_edible_path(@edible)
    assert_response :success
  end

end
