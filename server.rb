require 'sinatra/base'
require 'json'
require 'yaml'
require 'sinatra/jsonp'
class Temperature < Sinatra::Base
  helpers Sinatra::Jsonp
  CITY_DATA = YAML.load_file('./data/city_data.yml')

  get '/temperature' do
    return {error: "no city given"}.to_json unless params[:city]
    jsonp(city_data(params[:city].gsub(" ", '_').downcase))
  end

  def city_data(city)
    CITY_DATA[city] ? CITY_DATA[city] : {error: 'invalid city'}
  end

  get '/cities' do
    jsonp({cities: CITY_DATA.keys.map{|city|city.gsub("_"," ")}})
  end

  get '/' do
    "to get a list of the available cities go to /cities \n to get the temperature in a chosen city go to /temperature?city=city_name"
  end


end