require 'test_helper'

class AttentionSwsControllerTest < ActionController::TestCase
  setup do
    @attention_sw = attention_sws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attention_sws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attention_sw" do
    assert_difference('AttentionSw.count') do
      post :create, attention_sw: { comment: @attention_sw.comment, integer: @attention_sw.integer, issue: @attention_sw.issue, priority: @attention_sw.priority, type: @attention_sw.type, unity_id: @attention_sw.unity_id }
    end

    assert_redirected_to attention_sw_path(assigns(:attention_sw))
  end

  test "should show attention_sw" do
    get :show, id: @attention_sw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attention_sw
    assert_response :success
  end

  test "should update attention_sw" do
    patch :update, id: @attention_sw, attention_sw: { comment: @attention_sw.comment, integer: @attention_sw.integer, issue: @attention_sw.issue, priority: @attention_sw.priority, type: @attention_sw.type, unity_id: @attention_sw.unity_id }
    assert_redirected_to attention_sw_path(assigns(:attention_sw))
  end

  test "should destroy attention_sw" do
    assert_difference('AttentionSw.count', -1) do
      delete :destroy, id: @attention_sw
    end

    assert_redirected_to attention_sws_path
  end
end
