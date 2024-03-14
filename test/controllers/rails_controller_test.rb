require "test_helper"

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get rails_generate_url
    assert_response :success
  end

  test "should get controller" do
    get rails_controller_url
    assert_response :success
  end

  test "should get Items" do
    get rails_Items_url
    assert_response :success
  end

  test "should get show" do
    get rails_show_url
    assert_response :success
  end
end
