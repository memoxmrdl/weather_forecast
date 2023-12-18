# frozen_string_literal: true

class ApplicationClient
  def initialize(resource:, params: {})
    @resource = resource
    @params = params.with_indifferent_access
  end

  def list(&block)
    return yield if block

    result = repository_class.list
    presenter_class.new(resource: @resource).present(data: result)
  rescue => e
    log_error(e)

    []
  end
  alias_method :list!, :list

  def fetch
    result = repository_class.new(query_params:).retrieve

    presenter_class.new(resource: @resource).present(data: result)
  rescue => e
    log_error(e)

    @resource
  end
  alias_method :fetch!, :fetch

  private

  def repository_class
    raise NotImplementedError
  end

  def query_params
    raise NotImplementedError
  end

  def presenter_class
    raise NotImplementedError
  end

  def log_error(exception)
    puts exception
    Rails.logger.error(exception)
  end
end
