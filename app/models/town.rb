class Town < ActiveRecord::Base
  
  before_validation :load_position
  validates :lat,:lon, presence:true
  
  private
  def load_position
      places = Nominatim.search(self.name).limit(1).first
      if places
        self.lat = places.lat
        self.lon = places.lon
      end
  end
end