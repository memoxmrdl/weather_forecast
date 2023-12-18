# frozen_string_literal: true

class PlacesWithWeatherForecastUseCase < ApplicationUseCase
  step :validate_q
  step :search_places_from_reservamos
  step :places_with_weather_forecast

  private

  def validate_q(q:)
    if q.blank?
      Failure([])
    else
      Success(q:)
    end
  end

  def search_places_from_reservamos(q:)
    places = Reservamos::SearchPlacesClient.new(resource: [], params: { q: }).list

    Success(places:)
  end

  def places_with_weather_forecast(places:)
    places.map do |place|
      OpenWeatherMap::ForecastWeatherClient.new(resource: place, params: place).fetch
    end

    Success(places)
  end
end
