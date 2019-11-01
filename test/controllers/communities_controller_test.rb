# frozen_string_literal: true

require 'test_helper'

class CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should show community" do
    community = communities(:one)
    get community_url(community)
    assert_response :success
  end
end
