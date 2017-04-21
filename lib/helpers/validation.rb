module Helpers
  module Validation
    def self.validate(array)
      raise ArgumentError unless array.is_a?(Array)

    end

    private

  end
end