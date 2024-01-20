require "sinatra"
require "sinatra/reloader"
ENV.fetch("GMAPS_KEY")

get("/umbrella") do
  erb(:umbrella)
end

get("/process_umbrella") do
  @user_location = params.fetch("user_loc")

    HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=Merchandise%20Mart%20Chicago&key=GMAPS_KEY"
  erb(:umbrella_process)
end
