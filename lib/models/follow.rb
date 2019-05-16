module Models
  # Follow class has following attributes:
  # - user -> User object
  # - author -> Author object
  class Follow < ::ObjectRecord
    attr_reader :user, :author
    def initialize(args)
      @user = args[:user]
      @author = args[:author]
    end
  end
end
