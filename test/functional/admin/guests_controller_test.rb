require 'test_helper'

class Admin::GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = FactoryGirl.create(:guest)
  end

  test "valid username should get you in" do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(ADMIN_USERNAME, ADMIN_PASSWORD)
    get :index
    assert_response :success
    assert_equal [@guest], assigns(:guests)
  end

  test "invalid username should keep you out" do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('c4n', ADMIN_PASSWORD)
    get :index
    assert_response :unauthorized
  end    

  test "invalid password should keep you out" do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(ADMIN_USERNAME, 'poop')
    get :index
    assert_response :unauthorized
  end
end

class LoggedInAdminGuestsControllerTest < ActionController::TestCase
  tests Admin::GuestsController

  def setup
    @guest = FactoryGirl.create(:guest)
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(ADMIN_USERNAME, ADMIN_PASSWORD)
  end

  test "can create a guest" do
    assert_difference "Guest.count" do
      post :create, :guest => {:name => "Bob", :email => "Bob@Test.com"}
      assert_redirected_to admin_guests_path
    end
    g = Guest.last
    assert_equal "Bob", g.name
    assert_equal "bob@test.com", g.email
  end

  test "can invite a guest to reception" do
    put :update, :id => @guest.id, :guest => {:going_to_reception => true}
    assert_response :success
    @guest.reload
    assert @guest.going_to_reception?
  end

  test "can uninvite a guest to reception" do
    put :update, :id => @guest.id, :guest => {:going_to_reception => false}
    assert_response :success
    @guest.reload
    assert !@guest.going_to_reception?
  end
  
end
