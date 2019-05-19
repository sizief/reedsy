module Errors
  module Feed
    class RefreshError < StandardError
      def initialize
        super('Can not call refresh before calling retrieve. Please call retrieve first.')
      end
    end
  end
end
