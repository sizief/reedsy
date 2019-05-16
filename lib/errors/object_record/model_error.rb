module Errors
  module ObjectRecord
    class ModelError < StandardError
      def initialize
        super('You need to save one object to initialize this model on Object Record ')
      end
    end
  end
end
