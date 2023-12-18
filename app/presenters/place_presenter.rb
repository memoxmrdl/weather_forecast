# frozen_string_literal: true

class PlacePresenter < ApplicationPresenter
  private

  def mapper_attributes!
    @resource = Oj.load(@data.body)
  end
end
