class CrawlerController < ApplicationController
  def index
    @crawlers = Crawler.all
    @item = Crawler.lt_10000
  end

  def new
    @crawler = Crawler.new
  end

  def create
    @crawler = Crawler.new(crawler_params)
    if @crawler.save
      url = @crawler.url
      ApplicationJob.perform_later
      helpers.crawler(url)
      flash[:notice] = "Crawling operation was successfull."
      render json: {data: @crawler , status: 'success'}, status: :ok
    else
      render json: {data: @crawler.errors.full_messages , status: 'failure'},  status: :unprocessable_entity
    end
  end

  private
    def crawler_params
      params.require(:crawler).permit(:url)
    end
end
