class Town < ActiveRecord::Base
  
  private
  def load_position
      places = Nominatim.search(name).limit(1)
      self.lat = places.first.lat
      self.lon = places.first.lon
  end
end
