require 'test_helper'

class SwatenttionsControllerTest < ActionController::TestCase
  setup do
    @swatenttion = swatenttions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swatenttions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swatenttion" do
    assert_difference('Swatenttion.count') do
      post :create, swatenttion: { attention_id: @swatenttion.attention_id, comment: @swatenttion.comment, issue: @swatenttion.issue, priority: @swatenttion.priority, type_id: @swatenttion.type_id, unity_id: @swatenttion.unity_id }
    end

    assert_redirected_to swatenttion_path(assigns(:swatenttion))
  end

  test "should show swatenttion" do
    get :show, id: @swatenttion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swatenttion
    assert_response :success
  end

  test "should update swatenttion" do
    patch :update, id: @swatenttion, swatenttion: { attention_id: @swatenttion.attention_id, comment: @swatenttion.comment, issue: @swatenttion.issue, priority: @swatenttion.priority, type_id: @swatenttion.type_id, unity_id: @swatenttion.unity_id }
    assert_redirected_to swatenttion_path(assigns(:swatenttion))
  end

  test "should destroy swatenttion" do
    assert_difference('Swatenttion.count', -1) do
      delete :destroy, id: @swatenttion
    end

    assert_redirected_to swatenttions_path
  end
end
