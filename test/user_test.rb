require 'test_helper'

class UserTest < Minitest::Test
  def setup
    @name = 'ali'
    @user = Models::User.new(name: @name)
  end

  def test_user_name
    assert_equal @user.name, 'ali'
  end
end
