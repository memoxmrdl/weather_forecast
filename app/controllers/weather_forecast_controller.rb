# frozen_string_literal: true

class WeatherForecastController < ApplicationController
  def index
    PlacesWithWeatherForecastUseCase.call(q: params.permit(:q)) do |on|
      on.success { |response| render json: response }
      on.failure { |response| render json: response }
    end
  end
end
