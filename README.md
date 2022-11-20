# Crawler API
- A simple application which can be used to crawl on flipkart website to scrap the data(price, category, seller and so on).
- The following project is implemented using Rails v7.

## Getting Started ##
- Clone the project in your system
- After cloning, open a terminal, go to the root folder of the project and perform the
  following commands.

    1. `bundle install`
    2. `bundle exec rails server`
    3. `redis-server`
    4. `bundle exec sidekiq`

  The first command will install necessary gem and the second command will eun the server on port 3000 by default
  
## HostUrl
    localhost:3000


# APIs #

## Crawler
- This api will take url in its body params and returns the necessary data as response.

### Resource URL ###

[HOST_URL](#HostUrl)/crawler

### Method ####

```HTTP POST```

#### Response ####

```json
{
    "data": {
        "id": 35,
        "url": "https://www.flipkart.com/elligator-cat-eye-retro-square-oval-round-sunglasses/p/itm66596f152a3af?pid=SGLGGV2EVRWE9H9J&lid=LSTSGLGGV2EVRWE9H9JPS3A7W&marketplace=FLIPKART&store=26x&spotlightTagId=TrendingId_26x&srno=b_1_4&otracker=product_breadCrumbs_Sunglasses&fm=organic&iid=0146f51e-23b0-4d6f-95e4-32fa8e4cb302.SGLGGV2EVRWE9H9J.SEARCH&ppt=browse&ppn=browse&ssid=tqeh2dapu80000001668715667449",
        "title": "UV Protection Cat-eye, Retro Square, Oval, Round Sunglasses (54)   (For Men & Women, Black)",
        "price": 0,
        "size": "Medium",
        "stars": 4.1,
        "seller": "WinsomeWorld.",
        "category": "Sunglasses",
        "img_url": "https://rukminim1.flixcart.com/image/832/832/xif0q/sunglass/r/n/z/medium-candyb1-elligator-original-imaggtvrnnrbdvkn.jpeg?q=70",
        "created_at": "2022-11-19T20:14:34.062Z",
        "updated_at": "2022-11-19T20:14:34.062Z"
    },
    "status": "success"
}
```

#### Response parameters ####

| Name  |Description |
| ------------- | ------------- | 
| code  | 200 if success response  |
| message  | SUCCESS |  
| data  | ItemInfo |  

##### Request parameters #####
| Name  |Description |Type |
| ------------- | ------------- | -----------|
| url  | URL to be crawled(should be the item page from flipkart)  | valid uri format of minimum length 10  |

#### API Description ####

- Input Data is validated in the beginning.
- Fetch the data using NokoGiri package which is inside helper function of the respective Controller.
- Set the variables to the response parameters.
- Build and send the data in response.

## Category ##
- This is an associated model of Crawler where item of the items is stored

### Resource URL ###

[HOST_URL](#HostUrl)/category

### Method ####

```HTTP POST```

#### Response ####

```json
{
    "data":{
        "id":4,"name":"Sunglasses",
        "created_at":"2022-11-19T19:23:16.680Z",
        "updated_at":"2022-11-19T19:23:16.680Z"
        },
        "status":"success"
}
```
#### Response parameters ####

| Name  |Description |
| ------------- | ------------- |
| code  | 200 if success response  |
| message  | SUCCESS |
| data  | CategoryInfo |  


#### Error codes ####
- Default error codes used by rails


## Gems ##

Following are high level packages/gems
  1. Nokogiri:  Package for selecting the element inside html DOM
  2. Open-uri: Package for uri parsing
  3. Sidekiq: Background job processor/server


## Code Description ##

- Followed rails MVC pattern

