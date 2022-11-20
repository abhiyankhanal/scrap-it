require "test_helper"

class CrawlerControllerTest < ActionDispatch::IntegrationTest  
  test "index action must be success" do
    get :index
    assert_response :success
  end
  end

