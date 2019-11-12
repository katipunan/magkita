# frozen_string_literal: true

require 'test_helper'

class UserPolicyTest < ActiveSupport::TestCase
  def setup
    @member = users(:member)
    @admin = users(:admin)
  end

  def policy(user, record)
    Pundit.policy!(user, record)
  end

  test 'index' do
    refute policy(@member, User).index?
    assert policy(@admin, User).index?
  end

  test 'destroy' do
    user = create(:user)
    refute policy(@member, user).destroy?
    assert policy(@admin, user).destroy?
  end
end
