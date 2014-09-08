require 'test_helper'

class UploadFilesControllerTest < ActionController::TestCase
  setup do
    @upload_file = upload_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upload_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload_file" do
    assert_difference('UploadFile.count') do
      post :create, upload_file: { content_type: @upload_file.content_type, filename: @upload_file.filename, server_path: @upload_file.server_path }
    end

    assert_redirected_to upload_file_path(assigns(:upload_file))
  end

  test "should show upload_file" do
    get :show, id: @upload_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upload_file
    assert_response :success
  end

  test "should update upload_file" do
    patch :update, id: @upload_file, upload_file: { content_type: @upload_file.content_type, filename: @upload_file.filename, server_path: @upload_file.server_path }
    assert_redirected_to upload_file_path(assigns(:upload_file))
  end

  test "should destroy upload_file" do
    assert_difference('UploadFile.count', -1) do
      delete :destroy, id: @upload_file
    end

    assert_redirected_to upload_files_path
  end
end
