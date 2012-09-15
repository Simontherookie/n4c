require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "can get home page" do
    get :index
    assert_response :success
  end

  test "homepage has new session form" do
    get :index
    assert_select "form[action='/session']"
  end

  test "homepage can prepopulate the email input" do
    get :index, :email => "test@example.com"
    assert_select "input#session_email[value='test@example.com']"
  end

  test "can't get info page without being logged in" do
    get :info
    assert_redirected_to new_session_path
  end

end
class LoggedInInfoTest < ActionController::TestCase
  tests HomeController

  setup do
    @guest = FactoryGirl.create(:guest)
    login_as @guest
  end

  test "can get info page if logged in" do
    get :info
    assert_response :success
  end

  test "can rsvp to wedding and bbq" do
    get :info
    assert_select "input[name='guest[rsvp_wedding]']"
    assert_select "input[name='guest[rsvp_bbq]']"
  end

  test "rsvp_reception is shown if invited" do
    @guest.going_to_reception = true
    @guest.save

    get :info
    assert_select "input[name='guest[rsvp_reception]']"
  end

  test "rsvp_reception is not shown if not invited" do
    get :info
    assert_select "input[name='guest[rsvp_reception]']", 0
  end

end
