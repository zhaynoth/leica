require 'test_helper'

class UnitiesControllerTest < ActionController::TestCase
  setup do
    @unity = unities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unity" do
    assert_difference('Unity.count') do
      post :create, unity: { unity: @unity.unity, unity_subtype_id: @unity.unity_subtype_id }
    end

    assert_redirected_to unity_path(assigns(:unity))
  end

  test "should show unity" do
    get :show, id: @unity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unity
    assert_response :success
  end

  test "should update unity" do
    patch :update, id: @unity, unity: { unity: @unity.unity, unity_subtype_id: @unity.unity_subtype_id }
    assert_redirected_to unity_path(assigns(:unity))
  end

  test "should destroy unity" do
    assert_difference('Unity.count', -1) do
      delete :destroy, id: @unity
    end

    assert_redirected_to unities_path
  end
end
