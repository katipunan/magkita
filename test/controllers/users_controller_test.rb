# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'sign up' do
    get sign_up_path
    assert_response :success

    post users_path, params: {
      user: {
        name: 'John Doe',
        email: 'hi@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
