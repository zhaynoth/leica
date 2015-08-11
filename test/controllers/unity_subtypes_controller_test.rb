require 'test_helper'

class UnitySubtypesControllerTest < ActionController::TestCase
  setup do
    @unity_subtype = unity_subtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unity_subtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unity_subtype" do
    assert_difference('UnitySubtype.count') do
      post :create, unity_subtype: { subtype: @unity_subtype.subtype, unity_type_id: @unity_subtype.unity_type_id }
    end

    assert_redirected_to unity_subtype_path(assigns(:unity_subtype))
  end

  test "should show unity_subtype" do
    get :show, id: @unity_subtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unity_subtype
    assert_response :success
  end

  test "should update unity_subtype" do
    patch :update, id: @unity_subtype, unity_subtype: { subtype: @unity_subtype.subtype, unity_type_id: @unity_subtype.unity_type_id }
    assert_redirected_to unity_subtype_path(assigns(:unity_subtype))
  end

  test "should destroy unity_subtype" do
    assert_difference('UnitySubtype.count', -1) do
      delete :destroy, id: @unity_subtype
    end

    assert_redirected_to unity_subtypes_path
  end
end
