module Models
  # Upvote class has following attributes:
  # - user -> User object
  # - book -> Book object
  class Upvote
    attr_reader :user, :book
    def initialize(args)
      @user = args[:user]
      @book = args[:book]
    end
  end
end
