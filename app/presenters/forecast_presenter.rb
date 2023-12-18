# frozen_string_literal: true

class ForecastPresenter < ApplicationPresenter
  def initialize(resource:)
    super(resource:)
    @resource['weather_forecast'] = []
  end

  private

  def data_errors?
    @data.key?('cod') && (@data['cod'] >= 400 || @data['cod'] >= 500)
  end

  def mapper_attributes!
    return if data_errors?

    daily_forecast.each do |daily|
      @current_daily = daily

      new_daily = {}
      new_daily['date'] = forecasted_at
      new_daily['min_temp'] = min_temp
      new_daily['max_temp'] = max_temp

      @resource['weather_forecast'] << new_daily
    end
  end

  def daily_forecast
    @data.fetch('daily', [])
  end

  def forecasted_at
    Time.zone.at(@current_daily['dt']).to_date rescue nil
  end

  def min_temp
    @current_daily.fetch('temp', {}).fetch('min', 0)
  end

  def max_temp
    @current_daily.fetch('temp', {}).fetch('max', 0)
  end
end
