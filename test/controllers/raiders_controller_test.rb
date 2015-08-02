require 'test_helper'

class RaidersControllerTest < ActionController::TestCase
  setup do
    @raider = raiders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raiders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raider" do
    assert_difference('Raider.count') do
      post :create, raider: { acceptedTerms: @raider.acceptedTerms, lastName: @raider.lastName, name: @raider.name, rut: @raider.rut }
    end

    assert_redirected_to raider_path(assigns(:raider))
  end

  test "should show raider" do
    get :show, id: @raider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raider
    assert_response :success
  end

  test "should update raider" do
    patch :update, id: @raider, raider: { acceptedTerms: @raider.acceptedTerms, lastName: @raider.lastName, name: @raider.name, rut: @raider.rut }
    assert_redirected_to raider_path(assigns(:raider))
  end

  test "should destroy raider" do
    assert_difference('Raider.count', -1) do
      delete :destroy, id: @raider
    end

    assert_redirected_to raiders_path
  end
end
