require 'test_helper'

class UpvoteTest < Minitest::Test
  def setup
    @author = Models::Author.new(name: 'Isaac Asimov 1')
    @title = 'Foundation'
    @book = Models::Book.new(title: @title,
                             author: @author,
                             published_on: '01-05-1942')
    @user = Models::User.new(name: 'Ali')
    @upvote = Models::Upvote.new(book: @book, user: @user)
  end

  def test_upvote_name
    assert_equal @upvote.book.title, @title
  end

  def test_save
    @upvote.save
    assert_equal Models::Upvote.first.book.title, @title
  end

  def teardown
    reset_object_record
  end
end
