module Models
  # Book has following attributes:
  #  - author -> Author class
  #  - title
  #  - published_on
  class Book < ::ObjectRecord
    attr_reader :author, :title, :published_on
    def initialize(args)
      @author = args[:author]
      @title = args[:title]
      @published_on = args[:published_on]
    end
  end
end
