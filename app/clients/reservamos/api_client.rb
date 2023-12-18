# frozen_string_literal: true

module Reservamos
  class ApiClient < ApplicationClient
    private

    def repository_class
      ReservamosRepository
    end
  end
end
