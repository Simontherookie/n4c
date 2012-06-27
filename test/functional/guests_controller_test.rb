require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = Guest.create
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      xhr :post, :create, guest: { address: "42nd Street", email: "email@me.me", name: "N M" }
      assert_response :success
    end
  end
  
end
