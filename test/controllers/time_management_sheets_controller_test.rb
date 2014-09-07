require 'test_helper'

class TimeManagementSheetsControllerTest < ActionController::TestCase
  setup do
    @time_management_sheet = time_management_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_management_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_management_sheet" do
    assert_difference('TimeManagementSheet.count') do
      post :create, time_management_sheet: {  }
    end

    assert_redirected_to time_management_sheet_path(assigns(:time_management_sheet))
  end

  test "should show time_management_sheet" do
    get :show, id: @time_management_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_management_sheet
    assert_response :success
  end

  test "should update time_management_sheet" do
    patch :update, id: @time_management_sheet, time_management_sheet: {  }
    assert_redirected_to time_management_sheet_path(assigns(:time_management_sheet))
  end

  test "should destroy time_management_sheet" do
    assert_difference('TimeManagementSheet.count', -1) do
      delete :destroy, id: @time_management_sheet
    end

    assert_redirected_to time_management_sheets_path
  end
end
