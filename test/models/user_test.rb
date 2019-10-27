require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(email: 'user1@example.com')
  end

  test 'must have long password' do
    @user.password = 'short12'
    refute @user.valid?, 'Saved user with a short password'
    assert_not_nil @user.errors[:password], 'No validation error for password'
  end

  test 'must have password confirmation' do
    @user.password = 'password123'
    refute @user.valid?, 'Saved user with no password confirmation'
    assert_not_nil @user.errors[:password_confirmation],
      'No validation error for password confirmation'
  end

  test 'password and confirmation must be the same' do
    @user.password = 'password123'
    @user.password_confirmation = 'password'
    refute @user.valid?, 'Saved user with password not matching confirmation'
    assert_not @user.errors[:password_confirmation].blank?,
      'No validation error for password confirmation'
  end
end
