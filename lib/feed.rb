class Feed
  def initialize args
    @user = args[:user]
  end

  # It show a list of book titles that contains, in order:
  # 1. Books that user upvotes and also follows the author of that book
  # 2. Books that user upvotes
  # 3. Books that wrote by authors which user is following
  def retrieve
    followed_authors = user_favourite_authors
    upvoted_books = user_favourite_books

    authors_books = Array.new
    followed_authors.map{|author| authors_books << books_for(author) } 
    feed_books = (user_favourite_books + authors_books).flatten.uniq
    sort feed_books, user_authors, user_books
  end

  private

  def user_favourite_authors
    @user.favourite_authors
  end

  def user_favourite_books
    @user.favourite_books
  end

  def books_for author
    author.books
  end
end
