# frozen_string_literal: true

require 'test_helper'

class Admin::CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_communities_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_community_url
    assert_response :success
  end

  test 'should get edit' do
    community = communities(:one)
    get edit_admin_community_url(community)
    assert_response :success
  end
end
