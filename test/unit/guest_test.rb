require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  
  test "factory is valid" do
    assert FactoryGirl.build(:guest).valid?
  end
  
  test "guest requires name" do
    assert FactoryGirl.build(:guest, name: nil).invalid?
    assert FactoryGirl.build(:guest, name: "").invalid?
  end
  
  test "guest doesn't require address" do
    assert FactoryGirl.build(:guest, address: nil).valid?
  end
  
  test "guest requires email" do
    assert FactoryGirl.build(:guest, email: nil).invalid?
    assert FactoryGirl.build(:guest, email: "").invalid?
  end

  test "guest email is downcased" do
    guest = FactoryGirl.create(:guest, email: "aBc@DfG.cOm")
    assert_equal "abc@dfg.com", guest.email
  end

  test "guest can be going to reception" do
    assert FactoryGirl.build(:guest, going_to_reception: true).going_to_reception?
    assert !FactoryGirl.build(:guest, going_to_reception: false).going_to_reception?
  end
  
end
