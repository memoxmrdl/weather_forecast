# frozen_string_literal: true

module Reservamos
  class SearchPlacesClient < ApiClient
    def list
      list! do
        result = repository_class.new(query_params:).places

        presenter_class.new(resource: @resource).present(data: result)
      end
    end

    private

    def query_params
      { q: @params.fetch(:q, '') }
    end

    def presenter_class
      PlacePresenter
    end
  end
end
