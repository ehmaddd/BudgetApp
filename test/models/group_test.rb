require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test 'group has many deal_groups' do
    group = groups(:one)
    assert_respond_to group, :deal_groups
  end

  test 'group has many deals through deal_groups' do
    group = groups(:one)
    assert_respond_to group, :deals
  end
end
