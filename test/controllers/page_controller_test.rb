require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get board" do
    get :board
    assert_response :success
  end

end
