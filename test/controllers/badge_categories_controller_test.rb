require 'test_helper'

class BadgeCategoriesControllerTest < ActionController::TestCase
  setup do
    @badge_category = badge_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:badge_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create badge_category" do
    assert_difference('BadgeCategory.count') do
      post :create, badge_category: {  }
    end

    assert_redirected_to badge_category_path(assigns(:badge_category))
  end

  test "should show badge_category" do
    get :show, id: @badge_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @badge_category
    assert_response :success
  end

  test "should update badge_category" do
    patch :update, id: @badge_category, badge_category: {  }
    assert_redirected_to badge_category_path(assigns(:badge_category))
  end

  test "should destroy badge_category" do
    assert_difference('BadgeCategory.count', -1) do
      delete :destroy, id: @badge_category
    end

    assert_redirected_to badge_categories_path
  end
end
