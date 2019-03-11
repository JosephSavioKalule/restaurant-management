require 'test_helper'

class EdiblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edible = edibles(:one)
  end
  
  test "should get edibles index" do
    get edibles_path
    assert_response :success
    assert_select "title", "Edibles | RestoMan"
  end

  test "should get show" do
    get edible_path(@edible)
    assert_response :success
    assert_select "title", "#{@edible.name} | RestoMan"
  end

  test "should get new" do
    get new_edible_path
    assert_response :success
    assert_select "title", "New Edible | RestoMan"
  end

  test "should get edit" do
    get edit_edible_path(@edible)
    assert_response :success
    assert_select "title", "Edit Edible | RestoMan"
  end
  
  test "should create edible" do
    assert_difference "Edible.count" do
      post edibles_path, params: { edible: {
          name: 'Some name', description: 'Description...', price: '4.40'
      } }
    end
  end
  
  test "should update edible" do
    patch edible_url(@edible), params: { edible: {
        name: 'new_name', description: 'new_description', price: '99.99'
    } }
    @edible.reload
    assert_equal(@edible.name, 'new_name')
    assert_redirected_to edible_path(@edible)
  end
  
  test "should delete edible" do
    assert_difference('Edible.count', -1) do
      delete edible_path(@edible)
    end
  end

end
