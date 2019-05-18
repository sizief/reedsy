module Models
  # User class has only one attribute:
  # - name
  class User < ::ObjectRecord
    attr_reader :name

    def initialize(args)
      @name = args[:name]
    end

    # Returns list of Model::Author objects that user is followed
    def followee_authors(search_parameters = {})
      search_parameters[:user] = self
      (Follow.find_by search_parameters).map(&:author)
    end

    # Returns list of Model::Book objects that user is upvoted
    def upvoted_books(search_parameters = {})
      search_parameters[:user] = self
      (Upvote.find_by search_parameters).map(&:book)
    end
  end
end
