class Town < ActiveRecord::Base
  
  before_validation :load_position
  
  private
  def load_position
    if name.present?
      places = Nominatim.search(name).limit(1)
      self.latitude = places.first.latitude
      self.longitude = places.first.longitude
    end
  end

  def return_forecast
    ForecastIO.configure do |configuration|
      configuration.api_key = '2fb4c7915d8b262e68b95907891922a3'
    end
     
    forecast = ForecastIO.forecast(self.latitude,self.longitude)  
  end
end