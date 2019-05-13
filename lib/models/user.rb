module Models
  # User class has only one attribute:
  # - name
  class User
    attr_reader :name
    def initialize(args)
      @name = args[:name]
    end
  end
end
