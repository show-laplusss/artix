require "test_helper"

class Public::DirectMessageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_direct_message_new_url
    assert_response :success
  end

  test "should get show" do
    get public_direct_message_show_url
    assert_response :success
  end

  test "should get index" do
    get public_direct_message_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_direct_message_edit_url
    assert_response :success
  end
end
