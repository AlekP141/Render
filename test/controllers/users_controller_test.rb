require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get artworks" do
    get users_artworks_url
    assert_response :success
  end
end
