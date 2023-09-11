require "test_helper"

class CampCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get camp_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get camp_comments_destroy_url
    assert_response :success
  end
end
