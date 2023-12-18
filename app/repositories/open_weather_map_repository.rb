# frozen_string_literal: true

class OpenWeatherMapRepository
  include HTTParty

  base_uri 'https://api.openweathermap.org'
  default_params appid: ENV.fetch('OPEN_WEATHER_MAP_API_KEY', ''),
    exclude: 'minutely,hourly,current',
    units: 'metric',
    lang: 'es'

  def initialize(query_params: {})
    @query_params = { query: query_params }
  end

  def retrieve
    self.class.get("/data/2.5/onecall", @query_params)
  end
end
