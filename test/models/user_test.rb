require 'test_helper'

class UserTest < Minitest::Test
  def setup
    @name = 'ali'
    @user = Models::User.new(name: @name)
    @user.save
  end

  def test_user_name
    assert_equal @user.name, 'ali'
  end

  def test_save
    assert_equal Models::User.first.name, 'ali', Models::User.first.name
  end

  def test_followee_authors
    authors_list = create_favourite_authors_list
    assert_equal @user.followee_authors, authors_list
  end

  def test_upvoted_books
    books_list = create_favourite_books_list
    assert_equal @user.upvoted_books, books_list
  end

  def create_favourite_authors_list
    authers = %w(Gabriel Isaac)
    authors_objects = []
    authers.each do |author|
      a = Models::Author.new(name: author)
      a.save
      m = Models::Follow.new(user: @user, author: a)
      m.save
      authors_objects << a
    end
    authors_objects
  end

  def create_favourite_books_list
    books = %w(Mountain Sea)
    books_objects = []
    books.each do |book|
      b = Models::Book.new(title: book)
      b.save
      u = Models::Upvote.new(user: @user, book: b)
      u.save
      books_objects << b
    end
    books_objects
  end

  def teardown
    reset_object_record
  end
end
