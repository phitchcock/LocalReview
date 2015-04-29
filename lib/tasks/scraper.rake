namespace :scraper do
  desc "Grab Brewers"
  task scrape: :environment do
    require 'open-uri'
    require 'json'

    url = "https://www.kimonolabs.com/api/dug36c7i?apikey=yX8gci4oQJ7EbLeqUShTnfasDBGLN6cj"

    #prepare api request
    uri = URI.parse(url)
    #uri.query = URI.encode_www_form(params)

    #submit
    result = JSON.parse(open(uri).read)

    #display
    result["results"]["collection1"].each do |brewer|
      @establishment = Establishment.new
      @establishment.name = brewer["name"]
      @establishment.address = brewer["street"]
      @establishment.city = brewer["city"]["text"]
      @establishment.phone = brewer["phone"]
      @establishment.map = brewer["map"]["href"]
      @establishment.website = brewer["website"]["href"]
      @establishment.save
    end
  end
end