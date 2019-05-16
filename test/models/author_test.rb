require 'test_helper'

class AuthorTest < Minitest::Test
  def setup
    @name = 'Ali Garcia'
    @author = Models::Author.new(name: @name)
  end

  def test_author_name
    assert_equal @author.name, @name
  end

  def test_save
    @author.save
    assert Models::Author.find_by(:name, 'No name').empty?
    assert !Models::Author.find_by(:name, @name).empty?
  end

  def test_books
    books_list = create_books_list
    assert_equal @author.books, books_list
  end
  
  def create_books_list
    books = %w(Mountain Sea)
    books_objects = Array.new
    books.each do |book|
      b = Models::Book.new(title: book, author: @author)
      b.save
      books_objects << b
    end
    books_objects
  end
  
  def teardown
    reset_object_record
  end
end
