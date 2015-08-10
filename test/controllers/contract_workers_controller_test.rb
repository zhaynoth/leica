require 'test_helper'

class ContractWorkersControllerTest < ActionController::TestCase
  setup do
    @contract_worker = contract_workers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_worker" do
    assert_difference('ContractWorker.count') do
      post :create, contract_worker: { contract_id: @contract_worker.contract_id, estado: @contract_worker.estado, string: @contract_worker.string, worker_id: @contract_worker.worker_id }
    end

    assert_redirected_to contract_worker_path(assigns(:contract_worker))
  end

  test "should show contract_worker" do
    get :show, id: @contract_worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_worker
    assert_response :success
  end

  test "should update contract_worker" do
    patch :update, id: @contract_worker, contract_worker: { contract_id: @contract_worker.contract_id, estado: @contract_worker.estado, string: @contract_worker.string, worker_id: @contract_worker.worker_id }
    assert_redirected_to contract_worker_path(assigns(:contract_worker))
  end

  test "should destroy contract_worker" do
    assert_difference('ContractWorker.count', -1) do
      delete :destroy, id: @contract_worker
    end

    assert_redirected_to contract_workers_path
  end
end
