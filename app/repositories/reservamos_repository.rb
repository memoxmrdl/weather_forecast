# frozen_string_literal: true

class ReservamosRepository
  include HTTParty

  base_uri 'https://search.reservamos.mx/api'

  def initialize(query_params: {})
    @query_params = { query: query_params }
  end

  def places
    self.class.get("/v2/places", @query_params)
  end
end
