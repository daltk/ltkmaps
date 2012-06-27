require 'test_helper'

class CatogiriesControllerTest < ActionController::TestCase
  setup do
    @catogiry = catogiries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catogiries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catogiry" do
    assert_difference('Catogiry.count') do
      post :create, catogiry: @catogiry.attributes
    end

    assert_redirected_to catogiry_path(assigns(:catogiry))
  end

  test "should show catogiry" do
    get :show, id: @catogiry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catogiry
    assert_response :success
  end

  test "should update catogiry" do
    put :update, id: @catogiry, catogiry: @catogiry.attributes
    assert_redirected_to catogiry_path(assigns(:catogiry))
  end

  test "should destroy catogiry" do
    assert_difference('Catogiry.count', -1) do
      delete :destroy, id: @catogiry
    end

    assert_redirected_to catogiries_path
  end
end
