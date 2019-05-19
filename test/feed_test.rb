require 'test_helper'

class FeedTest < Minitest::Test
  def setup
    @user = Models::User.new(name: 'Ali')
    create_authors_books
    create_upvotes
    create_follows
    @feed = Feed.new(user: @user)
  end

  def test_retrieve
    feed = @feed.retrieve
    assert_equal feed, ['The man in a high castle', 'Ubik', 'Master and Margarita',
                        'Foundation', 'I, Robot', 'The End of Eternity', 'Nightfall',
                        'Do android dream of electic sheeps?', 'A scanner darkly']
  end

  def test_refresh
    @feed.retrieve
    sleep(2)
    author = Models::Author.find_by(name: 'Jorge Luis Borges').first
    follow = Models::Follow.new user: @user, author: author
    follow.save

    sleep(2)
    feed = @feed.refresh
    assert_equal feed, ['Borges and I', 'The Library of Babel']
  end

  def create_authors_books
    authors_books_list.each do |item|
      author = Models::Author.new(name: item[:author])
      author.save
      item[:books].each do |book|
        book = Models::Book.new(title: book, author: author)
        book.save
      end
    end
  end

  def create_follows
    ['Isaac Asimov', 'Philip K Dick'].each do |author|
      authors = Models::Author.find_by name: author
      follow = Models::Follow.new(author: authors.first, user: @user)
      follow.save
    end
  end

  def create_upvotes
    ['Master and Margarita', 'The man in a high castle', 'Ubik'].each do |book|
      books = Models::Book.find_by title: book
      upvote = Models::Upvote.new(book: books.first, user: @user)
      upvote.save
    end
  end

  def authors_books_list
    [
      {
        author: 'Mikhail Bulgakov',
        books: ['Master and Margarita', 'The white dog', 'Heart of a dog', 'A Young Doctor Notebook ']
      },
      {
        author: 'Isaac Asimov',
        books: ['Foundation', 'I, Robot', 'The End of Eternity', 'Nightfall']
      },
      {
        author: 'Philip K Dick',
        books: ['Do android dream of electic sheeps?', 'A scanner darkly', 'The man in a high castle', 'Ubik']
      },
      {
        author: 'Jorge Luis Borges',
        books: ['Borges and I', 'The Library of Babel']
      }
    ]
  end

  def teardown
    reset_object_record
  end
end
