require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @table = tables(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
    assert_select "title", "Orders | RestoMan"
  end

  test "should get new" do
    get new_table_order_path(@table)
    assert_response :success
    assert_select "title", "Create Order | RestoMan"
  end

  test "should create order" do
    assert_difference('Order.count') do
      post table_orders_path(@table), params: { order: { is_paid: @order.is_paid, table_id: @order.table_id } }
    end

    assert_redirected_to order_path(Order.last)
  end

  test "should show order" do
    get order_path(@order)
    assert_response :success
    
    assert_select "title", "Order ##{@order.id} | RestoMan"
  end

  test "should get edit" do
    get edit_order_path(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_path(@order), params: { order: { is_paid: @order.is_paid, table_id: @order.table_id } }
    assert_redirected_to order_path(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_path(@order)
    end

    assert_redirected_to table_orders_path(@order.table_id)
  end
end
