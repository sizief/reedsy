require_relative 'logging'
require_relative 'errors/feed/refresh_error'

# Feed gathers data related to user and prepare a list of favourite books
class Feed
  include Logging

  # Set this to creation date of first book.
  FIRST_BOOK_CREATION_TIME = Time.now - 86_400 * 365

  def initialize(args)
    @user = args[:user]
    @search_parameters = {}
    set_search_parameters(created_at: (FIRST_BOOK_CREATION_TIME..Time.now))
  end

  # Get list of book titles (based on @search_parameters) that meets two conditions:
  # 1. Books that user upvotes
  # 2. Books that wrote by authors which user is following
  def retrieve
    authors = get_followee_authors
    authors_books = get_authors_books authors
    upvoted_books = get_upvoted_books

    feed = merge authors_books, upvoted_books
    @retrieved_time = Time.now
    feed.map(&:title)
  end

  def refresh
    raise Errors::Feed::RefreshError if @retrieved_time.nil?
    set_search_parameters(created_at: (@retrieved_time..Time.now))
    retrieve
  end

  private

  # Merge the list in this order:
  # 1. Books that upvoted AND also wrote by author which user is followed
  # 2. Books upvotes
  # 3. Books from author which user is followed
  def merge(authors_books, upvoted_books)
    res = ([upvoted_books & authors_books] + upvoted_books + authors_books)
    res.flatten.uniq
  end

  def set_search_parameters(search_args)
    @search_parameters = {}
    search_args.map { |parameter, value| @search_parameters[parameter] = value }
  end

  def get_authors_books(authors)
    authors.map { |author| books_for(author) }.flatten
  end

  def get_followee_authors
    @user.followee_authors @search_parameters
  end

  def get_upvoted_books
    @user.upvoted_books @search_parameters
  end

  def books_for(author)
    author.books
  end
end
