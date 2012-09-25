require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "can prepopulate the email input" do
    get :new, :email => "test@example.com"
    assert_select "input#session_email[value='test@example.com']"
  end

  test "can log in as an existing guest" do
    guest = FactoryGirl.create(:guest)
    post :create, :session => {:email => guest.email}
    assert_redirected_to rsvp_path
    assert_equal guest.id, session[:guest_id]
  end

  test "can't log in as non-existing guest" do
    post :create, :session => {:email => "test@example.com"}
    assert_redirected_to root_path(:email => "test@example.com")
    assert_nil session[:guest_id]
  end

  test "can log out" do
    delete :destroy
    assert_redirected_to root_path
    assert_nil session[:guest_id]
  end

end
