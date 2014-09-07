require 'test_helper'

class BadgeLogsControllerTest < ActionController::TestCase
  setup do
    @badge_log = badge_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:badge_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create badge_log" do
    assert_difference('BadgeLog.count') do
      post :create, badge_log: {  }
    end

    assert_redirected_to badge_log_path(assigns(:badge_log))
  end

  test "should show badge_log" do
    get :show, id: @badge_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @badge_log
    assert_response :success
  end

  test "should update badge_log" do
    patch :update, id: @badge_log, badge_log: {  }
    assert_redirected_to badge_log_path(assigns(:badge_log))
  end

  test "should destroy badge_log" do
    assert_difference('BadgeLog.count', -1) do
      delete :destroy, id: @badge_log
    end

    assert_redirected_to badge_logs_path
  end
end
