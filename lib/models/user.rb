module Models
  # User class has only one attribute:
  # - name
  class User < ::ObjectRecord
    attr_reader :name

    def initialize(args)
      @name = args[:name]
    end

    # Returns list of Model::Author objects that user is followed
    def followee_authors
      (Follow.find_by :user, self).map(&:author)
    end

    # Returns list of Model::Book objects that user is upvoted
    def upvoted_books
      (Upvote.find_by :user, self).map(&:book)
    end
  end
end
