require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should get new" do
    get new_message_url
    assert_response :success
  end

  test "should create message" do
    post messages_url, params: { message: { body: "Test Message" } }
    assert_response :redirect
  end

  test "should show message" do
    get message_url(1)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_url(1)
    assert_response :success
  end

  test "should update message" do
    patch message_url(1), params: { message: { body: "Updated" } }
    assert_response :redirect
  end

  test "should destroy message" do
    delete message_url(1)
    assert_response :redirect
  end
end
