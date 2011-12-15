require 'test_helper'

class UserAddressesControllerTest < ActionController::TestCase
  setup do
    @user_address = user_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_address" do
    assert_difference('UserAddress.count') do
      post :create, user_address: @user_address.attributes
    end

    assert_redirected_to user_address_path(assigns(:user_address))
  end

  test "should show user_address" do
    get :show, id: @user_address.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_address.to_param
    assert_response :success
  end

  test "should update user_address" do
    put :update, id: @user_address.to_param, user_address: @user_address.attributes
    assert_redirected_to user_address_path(assigns(:user_address))
  end

  test "should destroy user_address" do
    assert_difference('UserAddress.count', -1) do
      delete :destroy, id: @user_address.to_param
    end

    assert_redirected_to user_addresses_path
  end
end
