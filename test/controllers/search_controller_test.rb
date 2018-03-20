require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_index_url
    assert_response :success
  end

  test "should get search" do
    get search_search_url
    assert_response :success
  end

  test "should get list" do
    get search_list_url
    assert_response :success
  end

end
