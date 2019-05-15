require 'test_helper'

class BookTest < Minitest::Test
  def setup
    @author = Models::Author.new(name: 'Isaac Asimov')
    @name = 'Foundation'
    @book = Models::Book.new(title: @name,
                             author: @author,
                             published_on: '01-05-1942')
    # Almost 77 years ago he wrote his masterpeice!
  end

  def test_book_name
    assert_equal @book.author.name, @author.name
    # Ignoring law of demeter,
    # will refactor after adding book_author_name method
  end
end
