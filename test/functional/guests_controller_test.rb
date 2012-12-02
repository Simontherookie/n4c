require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = FactoryGirl.create(:guest)
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      xhr :post, :create, guest: { address: "42nd Street", email: "email@me.me", name: "N M" }
      assert_response :success
    end
  end

  test "can't update guest if not logged in" do
    put :update, :id => @guest.to_param, :guest => @guest.attributes
    assert_response :redirect
  end

  test "can rsvp if logged in" do
    login_as @guest
    put :update, :id => @guest.to_param, :guest => {
      "rsvp_wedding" => "true",
      "rsvp_reception" => "true",
      "rsvp_bbq" => "true"
    }
    assert_redirected_to rsvp_path

    @guest.reload

    assert @guest.rsvp_wedding
    assert !@guest.rsvp_reception, "Guest should not rsvp to reception if not invited"
    assert @guest.rsvp_bbq
  end

  test "can rsvp to reception if invited" do
    @guest.going_to_reception = true
    @guest.save!
    login_as @guest
    put :update, :id => @guest.to_param, :guest => {
      "rsvp_wedding" => "true",
      "rsvp_reception" => "true",
      "rsvp_bbq" => "true"
    }

    @guest.reload

    assert @guest.rsvp_reception
  end

  test "can rsvp no to reception if invited" do
    @guest.going_to_reception = true
    @guest.save!
    login_as @guest
    put :update, :id => @guest.to_param, :guest => {
      "rsvp_wedding" => "true",
      "rsvp_reception" => "false",
      "rsvp_bbq" => "false"
    }

    @guest.reload

    assert !@guest.rsvp_reception, "Guest RSVPd no to reception"
  end
  
end
