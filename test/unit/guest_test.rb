require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  
  test "factory is valid" do
    assert FactoryGirl.build(:guest).valid?
  end
  
  test "guest requires name" do
    assert FactoryGirl.build(:guest, name: nil).invalid?
    assert FactoryGirl.build(:guest, name: "").invalid?
  end
  
  test "guest requires email" do
    assert FactoryGirl.build(:guest, email: nil).invalid?
    assert FactoryGirl.build(:guest, email: "").invalid?
  end
  
end
