require "test_helper"

class CrawlerControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @crawler_item = crawlers :one
  end
  test "should get index" do
    get root_path
    assert_response :success
  end
  test "success creating crawled data on database" do
    assert_difference "Crawler.count" do
    post crawler_path(@crawler_item)
  end
  assert_redirect_to crawler_index(Crawler.last)
  assert_equal "Crawling operation was successfull.", flash[:notice]
end
end

