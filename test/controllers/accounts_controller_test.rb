require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    post accounts_url, params: { account: { name: "Test Account" } }
    assert_response :redirect
  end

  test "should show account" do
    get account_url(1)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(1)
    assert_response :success
  end

  test "should update account" do
    patch account_url(1), params: { account: { name: "Updated" } }
    assert_response :redirect
  end

  test "should destroy account" do
    delete account_url(1)
    assert_response :redirect
  end
end
