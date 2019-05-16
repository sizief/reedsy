# Feed gathers data related to user and prepare a list of favourite books
class Feed
  def initialize(args)
    @user = args[:user]
  end

  # Get list of book titles that meets two conditions:
  # 1. Books that user upvotes
  # 2. Books that wrote by authors which user is following
  def retrieve
    authors = get_followee_authors
    authors_books = get_authors_books authors
    upvoted_books = get_upvoted_books

    feed = merge authors_books, upvoted_books
    feed.map(&:title)
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

  def get_authors_books(authors)
    book_list = []
    authors.map { |author| book_list << books_for(author) }.flatten
  end

  def get_followee_authors
    @user.followee_authors
  end

  def get_upvoted_books
    @user.upvoted_books
  end

  def books_for(author)
    author.books
  end
end
