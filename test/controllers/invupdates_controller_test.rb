require 'test_helper'

class InvupdatesControllerTest < ActionController::TestCase
  setup do
    @invupdate = invupdates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invupdates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invupdate" do
    assert_difference('Invupdate.count') do
      post :create, invupdate: {  }
    end

    assert_redirected_to invupdate_path(assigns(:invupdate))
  end

  test "should show invupdate" do
    get :show, id: @invupdate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invupdate
    assert_response :success
  end

  test "should update invupdate" do
    patch :update, id: @invupdate, invupdate: {  }
    assert_redirected_to invupdate_path(assigns(:invupdate))
  end

  test "should destroy invupdate" do
    assert_difference('Invupdate.count', -1) do
      delete :destroy, id: @invupdate
    end

    assert_redirected_to invupdates_path
  end
end
