require 'test_helper'

class CustomCategoriesToCategoriesControllerTest < ActionController::TestCase
  setup do
    @custom_categories_to_category = custom_categories_to_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_categories_to_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_categories_to_category" do
    assert_difference('CustomCategoriesToCategory.count') do
      post :create, custom_categories_to_category: @custom_categories_to_category.attributes
    end

    assert_redirected_to custom_categories_to_category_path(assigns(:custom_categories_to_category))
  end

  test "should show custom_categories_to_category" do
    get :show, id: @custom_categories_to_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_categories_to_category.to_param
    assert_response :success
  end

  test "should update custom_categories_to_category" do
    put :update, id: @custom_categories_to_category.to_param, custom_categories_to_category: @custom_categories_to_category.attributes
    assert_redirected_to custom_categories_to_category_path(assigns(:custom_categories_to_category))
  end

  test "should destroy custom_categories_to_category" do
    assert_difference('CustomCategoriesToCategory.count', -1) do
      delete :destroy, id: @custom_categories_to_category.to_param
    end

    assert_redirected_to custom_categories_to_categories_path
  end
end
