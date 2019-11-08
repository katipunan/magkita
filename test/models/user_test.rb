# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      email: 'user1@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  test 'must have long password' do
    short_password = 'short12'
    @user.password = short_password
    @user.password_confirmation = short_password
    refute @user.valid?, 'Saved user with a short password'
    assert_not @user.errors[:password].blank?,
      'No validation error for password'
  end

  test 'must have password confirmation' do
    @user.password_confirmation = nil
    refute @user.valid?, 'Saved user with no password confirmation'
    assert_not @user.errors[:password_confirmation].blank?,
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
