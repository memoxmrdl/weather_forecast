# frozen_string_literal: true

class ApplicationPresenter
  def initialize(resource:)
    @resource = resource
  end

  def present(data:)
    @data = data
    mapper_attributes!
    @resource
  end

  private

  def mapper_attributes!
    raise NotImplementedError
  end
end
