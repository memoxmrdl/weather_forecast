# frozen_string_literal: true

class PlacesWithWeatherForecastUseCase < ApplicationUseCase
  step :validate_city
  step :search_places_from_reservamos
  step :places_with_weather_forecast

  private

  def validate_city(city:)
    if city.blank?
      Failure([])
    else
      Success(city:)
    end
  end

  def search_places_from_reservamos(city:)
    places = Reservamos::SearchPlacesClient.new(resource: [], params: { city: }).list

    Success(places:)
  end

  def places_with_weather_forecast(places:)
    places.map do |place|
      OpenWeatherMap::ForecastWeatherClient.new(resource: place, params: place).fetch
    end

    Success(places)
  end
end
