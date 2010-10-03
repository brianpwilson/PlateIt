require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  test "empty" do
    user = User.new
    assert !user.valid?
  end
  
  test "valid user" do
    user = User.new(  :name => "brian",
                      :password => "test",
                      :password_confirmation => "test")
    assert user.valid?
  end
end
