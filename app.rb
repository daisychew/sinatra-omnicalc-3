require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/umbrella") do
  erb(:umbrella)
end

get("/process_umbrella") do
  @user_location = params.fetch("user_loc")

  url_encoded_string = @user_location.gsub(" ", "+")

  gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{url_encoded_string}&key=AIzaSyDKz4Y3bvrTsWpPRNn9ab55OkmcwZxLOHI"

  @raw_response = HTTP.get(gmaps_url).to_s

  @parsed_response = JSON.parse(@raw_response)

  @loc_hash = @parsed_response.dig("results", 0, "geometry", "location")

  @latitude = @loc_hash.fetch("lat")

  @longitude = @loc_hash.fetch("lng")
  erb(:umbrella_process)
end
