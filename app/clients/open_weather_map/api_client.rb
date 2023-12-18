# frozen_string_literal: true

module OpenWeatherMap
  class ApiClient < ApplicationClient
    private

    def repository_class
      OpenWeatherMapRepository
    end
  end
end
