class CrawlerController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def crawler(url)
    html_doc = Nokogiri::HTML(URI.open(url))
    @url = url
    @crawler.title = html_doc.css('.B_NuCI').children.text
    @crawler.price = html_doc.css('._30jeq3._16Jk6d').children.text
    @crawler.size = html_doc.css('._1fGeJ5._2UVyXR._31hAvz').children[0].text
    @crawler.img_url =  html_doc.css('._2r_T1I._396QI4').attribute('src').value
    @crawler.seller = html_doc.xpath('/html[1]/body[1]/div[1]/div[1]/div[3]/div[1]/div[2]
      /div[6]/div[1]/div[1]/div[2]/div[1]/span[1]/span[1]').children.text
    @crawler.stars = html_doc.xpath('/html[1]/body[1]/div[1]/div[1]/div[3]/div[1]/div[2]
      /div[6]/div[4]/div[1]/div[1]/div[2]/span[1]/div[1]').text
    @crawler.category = html_doc.xpath('/html[1]/body[1]/div[1]/div[1]/div[3]/div[1]/div[2]
      /div[1]/div[1]/div[1]/div[2]/a[1]').children.text
  end

  def index
    @crawlers = Crawler.all
  end

  def new
    @crawler = Crawler.new
  end

  def create
    @crawler = Crawler.new(crawler_params)
    if @crawler.save
      url = @crawler.url
      crawler(url)
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
