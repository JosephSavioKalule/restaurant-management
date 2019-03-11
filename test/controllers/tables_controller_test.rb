require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table = tables(:one)
  end

  test "should get index" do
    get tables_path
    assert_response :success
    assert_select "title", "Tables | RestoMan"
  end

  test "should get new" do
    get new_table_path
    assert_response :success
    assert_select "title", "Add Table | RestoMan"
  end

  test "should create table" do
    assert_difference('Table.count') do
      post tables_url, params: { table: { name: @table.name, number_of_places: @table.number_of_places } }
    end

    assert_redirected_to table_url(Table.last)
  end

  test "should show table" do
    get table_url(@table)
    assert_response :success
    assert_select "title", "Table: #{@table.name} | RestoMan"
  end

  test "should get edit" do
    get edit_table_url(@table)
    assert_response :success
    assert_select "title", "Edit Table ##{@table.id} | RestoMan"
  end

  test "should update table" do
    patch table_url(@table), params: { table: { name: @table.name, number_of_places: @table.number_of_places } }
    assert_redirected_to table_url(@table)
  end

  test "should destroy table" do
    assert_difference('Table.count', -1) do
      delete table_url(@table)
    end

    assert_redirected_to tables_url
  end
end
