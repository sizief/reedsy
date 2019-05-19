module Models
  # Class Author has one attribute:
  # - name
  class Author < ::ObjectRecord
    attr_accessor :name

    def initialize(args)
      @name = args[:name]
    end

    def books
      Book.find_by author: self
    end
  end
end
