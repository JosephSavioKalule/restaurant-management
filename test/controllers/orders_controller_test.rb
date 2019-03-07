require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @table = tables(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_table_order_path(@table)
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post table_orders_url(@table), params: { order: { is_paid: @order.is_paid, table_id: @order.table_id } }
    end

    assert_redirected_to table_order_path(Order.last.table, Order.last)
  end

  test "should show order" do
    get table_order_path(@order.table_id, @order)
    assert_response :success
  end

  test "should get edit" do
    get edit_table_order_path(@order.table, @order)
    assert_response :success
  end

  test "should update order" do
    patch table_order_path(@order.table, @order), params: { order: { is_paid: @order.is_paid, table_id: @order.table_id } }
    assert_redirected_to table_order_path(@order.table, @order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete table_order_path(@order.table_id, @order)
    end

    assert_redirected_to table_orders_path(@order.table_id)
  end
end
