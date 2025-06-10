require "test_helper"

class InboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inboxes_url
    assert_response :success
  end

  test "should get new" do
    get new_inbox_url
    assert_response :success
  end

  test "should create inbox" do
    post inboxes_url, params: { inbox: { name: "Test Inbox" } }
    assert_response :redirect
  end

  test "should show inbox" do
    get inbox_url(1)
    assert_response :success
  end

  test "should get edit" do
    get edit_inbox_url(1)
    assert_response :success
  end

  test "should update inbox" do
    patch inbox_url(1), params: { inbox: { name: "Updated" } }
    assert_response :redirect
  end

  test "should destroy inbox" do
    delete inbox_url(1)
    assert_response :redirect
  end
end
