require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get Profile" do
    get :Profile
    assert_response :success
  end

  test "should get Notifications" do
    get :Notifications
    assert_response :success
  end

  test "should get Settings" do
    get :Settings
    assert_response :success
  end

end
