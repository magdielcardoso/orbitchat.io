require "test_helper"

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conversations_url
    assert_response :success
  end

  test "should get new" do
    get new_conversation_url
    assert_response :success
  end

  test "should create conversation" do
    post conversations_url, params: { conversation: { title: "Test Conversation" } }
    assert_response :redirect
  end

  test "should show conversation" do
    get conversation_url(1)
    assert_response :success
  end

  test "should get edit" do
    get edit_conversation_url(1)
    assert_response :success
  end

  test "should update conversation" do
    patch conversation_url(1), params: { conversation: { title: "Updated" } }
    assert_response :redirect
  end

  test "should destroy conversation" do
    delete conversation_url(1)
    assert_response :redirect
  end
end
