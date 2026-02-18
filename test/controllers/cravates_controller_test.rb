require "test_helper"

class CravatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cravates_index_url
    assert_response :success
  end

  test "should get show" do
    get cravates_show_url
    assert_response :success
  end
end
