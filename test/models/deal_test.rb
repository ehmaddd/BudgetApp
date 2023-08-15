require 'test_helper'

class DealTest < ActiveSupport::TestCase
  test 'deal belongs to an author' do
    deal = deals(:one)
    assert_respond_to deal, :author
  end

  test 'deal has many groups through deal_groups' do
    deal = deals(:one)
    assert_respond_to deal, :groups
  end
end
