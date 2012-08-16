require 'test_helper'

class Admin::GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = FactoryGirl.create(:guest)
  end

  test "valid username should get you in" do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('chelsea4nick', 'toddandwestleyare#1')
    get :index
    assert_response :success
    assert_equal [@guest], assigns(:guests)
  end

  test "invalid username should keep you out" do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('c4n', 'toddandwestleyare#1')
    get :index
    assert_response :unauthorized
  end    

  test "invalid password should keep you out" do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('chelsea4nick', 'poop')
    get :index
    assert_response :unauthorized
  end
  
end
