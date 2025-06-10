require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    post users_url, params: { user: { email: "test@example.com", password: "password" } }
    assert_response :redirect
  end

  test "should show user" do
    get user_url(1)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(1)
    assert_response :success
  end

  test "should update user" do
    patch user_url(1), params: { user: { email: "updated@example.com" } }
    assert_response :redirect
  end

  test "should destroy user" do
    delete user_url(1)
    assert_response :redirect
  end
end
