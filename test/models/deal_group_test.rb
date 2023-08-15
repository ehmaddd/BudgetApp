require 'test_helper'

class DealGroupTest < ActiveSupport::TestCase
  test 'deal_group belongs to a deal' do
    deal_group = deal_groups(:one)
    assert_respond_to deal_group, :deal
  end

  test 'deal_group belongs to a group' do
    deal_group = deal_groups(:one)
    assert_respond_to deal_group, :group
  end
end
