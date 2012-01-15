require 'test_helper'

class AppliedLoansControllerTest < ActionController::TestCase
  setup do
    @applied_loan = applied_loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applied_loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create applied_loan" do
    assert_difference('AppliedLoan.count') do
      post :create, applied_loan: @applied_loan.attributes
    end

    assert_redirected_to applied_loan_path(assigns(:applied_loan))
  end

  test "should show applied_loan" do
    get :show, id: @applied_loan.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @applied_loan.to_param
    assert_response :success
  end

  test "should update applied_loan" do
    put :update, id: @applied_loan.to_param, applied_loan: @applied_loan.attributes
    assert_redirected_to applied_loan_path(assigns(:applied_loan))
  end

  test "should destroy applied_loan" do
    assert_difference('AppliedLoan.count', -1) do
      delete :destroy, id: @applied_loan.to_param
    end

    assert_redirected_to applied_loans_path
  end
end
