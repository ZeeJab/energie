class HomeController < ApplicationController
  def index
  end

  def data
    Building.delete_all
    x = HTTTParty.get('http://data.cityofnewyork.us/api/views/74cu-ncm4/rows.json')
    y = JSON(x.body)
    lat = y["data"].first[8][1]
    long = y["data"].first[8][2]
    building_type = y["data"].first[9]
    consumption = y["data"].first[10]


  end


end