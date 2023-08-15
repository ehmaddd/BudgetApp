require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user has many deals" do
    user = users(:one)
    assert_respond_to user, :deals
  end

  test "user has many groups through deals" do
    user = users(:one)
    assert_respond_to user, :groups
  end
end
