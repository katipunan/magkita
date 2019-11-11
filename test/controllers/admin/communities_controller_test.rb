# frozen_string_literal: true

require 'test_helper'

class Admin::CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect to sign in page when logged out' do
    get admin_communities_url
    assert_redirected_to sign_in_path

    get new_admin_community_url
    assert_redirected_to sign_in_path

    community = communities(:one)
    get edit_admin_community_url(community)
    assert_redirected_to sign_in_path
  end

  test 'should get index' do
    get admin_communities_url(as: users(:member))
    assert_response :success
  end

  test 'should get new' do
    get new_admin_community_url(as: users(:member))
    assert_response :success
  end

  test 'should get edit' do
    community = communities(:one)
    get edit_admin_community_url(community, as: users(:member))
    assert_response :success
  end
end
