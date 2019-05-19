require_relative 'lib/models'
require_relative 'lib/feed'

# Create user
Models::User.new(name: 'user u1').save
user_1 = Models::User.first

# Create Author
author_1 = Models::Author.new(name: 'author a1')
author_1.save

# Follow Author
Models::Follow.new(author: author_1, user: user_1).save

# Create Book
book_1 = Models::Book.new(title: 'book b1', author: author_1)
book_1.save

book_2 = Models::Book.new(title: 'book b2', author: author_1)
book_2.save

# Create Upvotes
Models::Upvote.new(book: book_1, user: user_1).save

# Find and retrieve models
# p Models::Upvote.all

# Run Feed
feed = Feed.new(user: user_1)
p feed.retrieve #=> ["book b1", "book b2"]

# Adding new author (Rumi, Iranian poet), adding one of his books, and following him
new_author = Models::Author.new(name: 'Rumi')
new_author.save
Models::Book.new(title: 'The Essential', author: new_author).save
Models::Follow.new(user: user_1, author: new_author).save

sleep(2)
# Refreshe feed
p feed.refresh #=> ['The Essential']
