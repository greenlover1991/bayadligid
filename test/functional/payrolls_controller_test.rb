require 'test_helper'

class PayrollsControllerTest < ActionController::TestCase
  setup do
    @payroll = payrolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payrolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payroll" do
    assert_difference('Payroll.count') do
      post :create, payroll: @payroll.attributes
    end

    assert_redirected_to payroll_path(assigns(:payroll))
  end

  test "should show payroll" do
    get :show, id: @payroll.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payroll.to_param
    assert_response :success
  end

  test "should update payroll" do
    put :update, id: @payroll.to_param, payroll: @payroll.attributes
    assert_redirected_to payroll_path(assigns(:payroll))
  end

  test "should destroy payroll" do
    assert_difference('Payroll.count', -1) do
      delete :destroy, id: @payroll.to_param
    end

    assert_redirected_to payrolls_path
  end
end
