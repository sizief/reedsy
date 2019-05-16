require 'test_helper'

class FollowTest < Minitest::Test
  def setup
    @user = Models::User.new(name: 'Ali')
    @author = Models::Author.new(name: 'Isaac Asimov')
    @follow = Models::Follow.new(user: @user, author: @author)
  end

  def test_follow_user_name
    assert_equal @follow.user.name, @user.name
  end

  def test_follow_author_name
    assert_equal @follow.author.name, @author.name
  end

  def test_save
    @follow.save
    assert_equal Models::Follow.first.author.name, @author.name
  end

  def teardown
    reset_object_record
  end
end
