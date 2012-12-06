class HomeController < ApplicationController
  def index
  end

  def data
    Building.delete_all
    x = HTTParty.get('http://data.cityofnewyork.us/api/views/74cu-ncm4/rows.json')
    
    #binding.pry

    y = JSON(x.body)

    y["data"].each do |d|
      lat = d.first[8][1]
      long = d.first[8][2]
      building_type = d.first[9]
      consumption = d.first[10] 
      zip = d[8][0].split('"')[-2] if d[8][0]
      building = Building.create(:building_type => building_type, :lat => lat, :long => long, :kwh => consumption, :zipcode => zip)
    end
    @buildings = Building.all
    redirect_to root_path
  end

end