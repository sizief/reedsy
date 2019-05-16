require_relative 'lib/models'
=begin
u1 = Models::User.new(name: 'user u1')
u1.save

u2 = Models::User.new(name: 'user u2')
u2.save

a1 = Models::Author.new(name: 'author a1')
a1.save

a2 = Models::Author.new(name: 'author a2')
a2.save

b1 = Models::Book.new(title: 'book b1', author: a1)
b1.save

b2 = Models::Book.new(title: 'book b2', author: a1)
b2.save

b3 = Models::Book.new(title: 'book b3', author: a2)
b3.save

up1 = Models::Upvote.new(book: b1, user: u1)
up1.save

up3 = Models::Upvote.new(book: b2, user: u1)
up3.save

up2 = Models::Upvote.new(book: b2, user: u2)
up2.save

#p Models::Upvote.all
p Models::Upvote.find_by :user, u1

=begin
p "------------"
p Models::Book.all
p "------------"
a1.name = 'gholi'
p Models::Book.all
=end
