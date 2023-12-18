# frozen_string_literal: true

module OpenWeatherMap
  class ForecastWeatherClient < ApiClient
    private

    def query_params
      { lat: @params['lat'], lon: @params['long'] }
    end

    def presenter_class
      ForecastPresenter
    end
  end
end
