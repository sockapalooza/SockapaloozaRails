require 'test_helper'

class OrderingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get orderings_create_url
    assert_response :success
  end

  test "should get update" do
    get orderings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get orderings_destroy_url
    assert_response :success
  end

end
