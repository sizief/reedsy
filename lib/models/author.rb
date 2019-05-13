module Models
  # Class Author has one attribute:
  # - name
  class Author
    attr_reader :name
    def initialize(args)
      @name = args[:name]
    end
  end
end
