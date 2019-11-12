# frozen_string_literal: true

require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect to sign in page when logged out' do
    get admin_users_url
    assert_redirected_to sign_in_path
  end

  test 'should not get index when logged in as member' do
    user = users(:member)
    assert_raises(Pundit::NotAuthorizedError) do
      get admin_users_url(as: user)
    end
  end

  test 'should get index when logged in as admin' do
    user = users(:admin)
    get admin_users_url(as: user)
    assert_response :success
  end
end
