require_relative 'lib/models'

# Create user
u1 = Models::User.new(name: 'user u1')
u1.save

# Create Author
a1 = Models::Author.new(name: 'author a1')
a1.save

#Create Book
b1 = Models::Book.new(title: 'book b1', author: a1)
b1.save

b2 = Models::Book.new(title: 'book b2', author: a1)
b2.save

# Create Upvotes
up1 = Models::Upvote.new(book: b1, user: u1)
up1.save

up2 = Models::Upvote.new(book: b2, user: u2)
up2.save

# Find and retrieve models
p Models::Upvote.all
p Models::Upvote.find_by :user, u1

# run Feed
 feed = Feed.new(user: u1)
 p feed.retrieve
 #add some more books to upvote or follow new author
 p feed.refresh
