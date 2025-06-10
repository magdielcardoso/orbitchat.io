require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    post contacts_url, params: { contact: { name: "Test Contact" } }
    assert_response :redirect
  end

  test "should show contact" do
    get contact_url(1)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(1)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(1), params: { contact: { name: "Updated" } }
    assert_response :redirect
  end

  test "should destroy contact" do
    delete contact_url(1)
    assert_response :redirect
  end
end
