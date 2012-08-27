require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "can get home page" do
    get :index
    assert_response :success
  end

  test "can't get info page without being logged in" do
    get :info
    assert_redirected_to new_session_path
  end

  test "can get info page if logged in" do
    guest = FactoryGirl.create(:guest)
    login_as guest
    get :info
    assert_response :success
  end

end
