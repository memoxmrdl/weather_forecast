# frozen_string_literal: true

require "dry/monads/all"

class ApplicationUseCase
  include Dry::Transaction
  include Dry::Monads

  def self.call(...)
    new.call(...)
  end
end
