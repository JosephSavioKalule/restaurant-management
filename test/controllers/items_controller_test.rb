require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @item = items(:one)
    @edible = edibles(:two)
  end
  
  test "should get new" do
    get new_order_item_path(@order)
    assert_response :success
    assert_select "title", "Add Item | RestoMan"
  end
  
  test "should get edit" do
    get edit_item_path(@item)
    assert_response :success
    assert_select "title", "Edit Item | RestoMan"
  end

  test "should create item" do
    assert_difference('Item.count') do
      post order_items_path(@order), params: { item: { edible_id: @edible.id, quantity: 2 } }
    end
  end
  
  test "should update item" do
    patch item_path(@item), params: { item: { edible_id: @edible.id, quantity: 9 } }
    assert_redirected_to order_path(@item.order)
    assert_equal @item.reload.quantity, 9
  end
  
  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_path(@item)
    end

    assert_redirected_to order_path(@item.order)
  end

end
