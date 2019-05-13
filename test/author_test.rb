require 'test_helper'

class AuthorTest < Minitest::Test
  def setup
    @name = 'Isaac Asimov'
    @user = Models::User.new(name: @name)
  end

  def test_author_name
    assert_equal @user.name, 'Isaac Asimov'
  end
end
