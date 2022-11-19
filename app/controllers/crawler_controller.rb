class CrawlerController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def crawler(url)
    html_doc = Nokogiri::HTML(URI.open(url))
    @url = url
    @title = html_doc.css('.B_NuCI').children.text
    @price = html_doc.css('._30jeq3._16Jk6d').children.text
    @size = html_doc.css('._1fGeJ5._2UVyXR._31hAvz').children[0].text
    @img_url =  html_doc.css('._2r_T1I._396QI4').attribute('src').value
    @seller = html_doc.xpath('/html[1]/body[1]/div[1]/div[1]/div[3]/div[1]/div[2]
      /div[6]/div[1]/div[1]/div[2]/div[1]/span[1]/span[1]').children.text
    @rating = html_doc.xpath('/html[1]/body[1]/div[1]/div[1]/div[3]/div[1]/div[2]
      /div[6]/div[4]/div[1]/div[1]/div[2]/span[1]/div[1]').text
    @category = html_doc.xpath('/html[1]/body[1]/div[1]/div[1]/div[3]/div[1]/div[2]
      /div[1]/div[1]/div[1]/div[2]/a[1]').children.text
  end

  def index
    @crawlers = Crawler.all
    crawler("https://www.flipkart.com/elligator-cat-eye-retro-square-oval-round-sunglasses/p/itm66596f152a3af?pid=SGLGGV2EVRWE9H9J&lid=LSTSGLGGV2EVRWE9H9JPS3A7W&marketplace=FLIPKART&store=26x&spotlightTagId=TrendingId_26x&srno=b_1_4&otracker=product_breadCrumbs_Sunglasses&fm=organic&iid=0146f51e-23b0-4d6f-95e4-32fa8e4cb302.SGLGGV2EVRWE9H9J.SEARCH&ppt=browse&ppn=browse&ssid=tqeh2dapu80000001668715667449")
  end

  def new
    @crawler = Crawler.new
  end

  def create
    @crawler = Crawler.new(crawler_params)
    if @crawler.save
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
