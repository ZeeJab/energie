class HomeController < ApplicationController
  def index

    @entrances = Subway.all

  end

  def entrances
  Subway.delete_all
    x = HTTParty.get('http://data.cityofnewyork.us/api/views/drex-xx56/rows.json')
    y = JSON(x.body)
    y["data"].each do |t|
      lines_array = t.last.split('-')
      lines_array.each do |f|
        point = t[9][5]["point"]
        s = Subway.create(:name=> t[10], :latitude => point[1], :longitude => point[0], :line => f)      
      end
    end
    @entrances = Subway.all

  end

  def plot
    @subways = Subway.where(:line => params[:commit])
  end

   def search
      @subways = Subway.text_search(params[:commit])
    end

end