class HomeController < ApplicationController
  def index
  end

  def data
    Building.delete_all
    x = HTTTParty.get('http://data.cityofnewyork.us/api/views/74cu-ncm4/rows.json')
    y = JSON(x.body)
    y["data"].each do |d|
      lat = d.first[8][1]
      long = d.first[8][2]
      building_type = d.first[9]
      consumption = d.first[10]
      zip = JSON(d[0][8][0])['zip']
      building = Building.create(:building_type => building_type, :lat => lat, :long => long, :kwh => consumption, :zipcode => zip)
    end
    @buildings = Building.all
  end


end