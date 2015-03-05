require 'sinatra/base'
require 'json'
require 'yaml'

class Temperature < Sinatra::Base

  CITY_DATA = YAML.load_file('./data/city_data.yml')

  get '/temperature' do
    return {error: "no city given"}.to_json unless params[:city]
    city_data(params[:city].gsub(" ", '_').downcase).to_json
  end

  def city_data(city)
    CITY_DATA[city] ? CITY_DATA[city] : {error: 'invalid city'}
  end

  get '/cities' do
    {cities: CITY_DATA.keys.map{|city|city.gsub("_"," ")}}.to_json
  end

  get '/' do
    "to get a list of the available cities go to /cities \n to get the temperature in a chosen city go to /temperature?city=city_name"
  end

end