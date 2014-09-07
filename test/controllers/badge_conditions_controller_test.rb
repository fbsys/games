require 'test_helper'

class BadgeConditionsControllerTest < ActionController::TestCase
  setup do
    @badge_condition = badge_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:badge_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create badge_condition" do
    assert_difference('BadgeCondition.count') do
      post :create, badge_condition: {  }
    end

    assert_redirected_to badge_condition_path(assigns(:badge_condition))
  end

  test "should show badge_condition" do
    get :show, id: @badge_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @badge_condition
    assert_response :success
  end

  test "should update badge_condition" do
    patch :update, id: @badge_condition, badge_condition: {  }
    assert_redirected_to badge_condition_path(assigns(:badge_condition))
  end

  test "should destroy badge_condition" do
    assert_difference('BadgeCondition.count', -1) do
      delete :destroy, id: @badge_condition
    end

    assert_redirected_to badge_conditions_path
  end
end
