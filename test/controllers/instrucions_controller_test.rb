require 'test_helper'

class InstrucionsControllerTest < ActionController::TestCase
  setup do
    @instrucion = instrucions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instrucions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instrucion" do
    assert_difference('Instrucion.count') do
      post :create, instrucion: {  }
    end

    assert_redirected_to instrucion_path(assigns(:instrucion))
  end

  test "should show instrucion" do
    get :show, id: @instrucion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instrucion
    assert_response :success
  end

  test "should update instrucion" do
    patch :update, id: @instrucion, instrucion: {  }
    assert_redirected_to instrucion_path(assigns(:instrucion))
  end

  test "should destroy instrucion" do
    assert_difference('Instrucion.count', -1) do
      delete :destroy, id: @instrucion
    end

    assert_redirected_to instrucions_path
  end
end
