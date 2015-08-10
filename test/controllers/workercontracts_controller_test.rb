require 'test_helper'

class WorkercontractsControllerTest < ActionController::TestCase
  setup do
    @workercontract = workercontracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workercontracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workercontract" do
    assert_difference('Workercontract.count') do
      post :create, workercontract: { contract_id: @workercontract.contract_id, estado: @workercontract.estado, worker_id: @workercontract.worker_id }
    end

    assert_redirected_to workercontract_path(assigns(:workercontract))
  end

  test "should show workercontract" do
    get :show, id: @workercontract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workercontract
    assert_response :success
  end

  test "should update workercontract" do
    patch :update, id: @workercontract, workercontract: { contract_id: @workercontract.contract_id, estado: @workercontract.estado, worker_id: @workercontract.worker_id }
    assert_redirected_to workercontract_path(assigns(:workercontract))
  end

  test "should destroy workercontract" do
    assert_difference('Workercontract.count', -1) do
      delete :destroy, id: @workercontract
    end

    assert_redirected_to workercontracts_path
  end
end
