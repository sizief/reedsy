module Models
  # User class has only one attribute:
  # - name
  class User < ::ObjectRecord
    attr_reader :name
    
    def initialize(args)
      @name = args[:name]
    end

    # list of Model::Author objects that user is followed
    def favourite_authors
      (Follow.find_by :user, self).map { |f| f.author}
    end

    # list of Model::Book objects that user is upvoted
    def favourite_books
      (Upvote.find_by :user, self).map { |f| f.book}
    end
  end
end
