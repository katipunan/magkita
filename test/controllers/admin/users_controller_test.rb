# frozen_string_literal: true

require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect to sign in page when logged out' do
    get admin_users_url
    assert_redirected_to sign_in_path
  end

  test 'should get index when logged in' do
    user = users(:member)
    get admin_users_url(as: user)
    assert_response :success
  end
end
