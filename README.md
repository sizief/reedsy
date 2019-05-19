Q1. Really hard question. OK, I am Ali, 36, married and Here is what I love to do:
- Travelling with my wife and wandering around in big cities.
- Creating digital products (Coding, designing, scaling, everything)
- Playing with our cats (Tesla, Jimmy)
- Doing Tai-chi, Running, Mountain climbing. 
- Learning, reading sci fi books.
Achievements:
- Creating products that solve problems of thousands of users (https://zoraq.com, https://parvazhub.com)
- Run 10K in one session
- Transform software teams to become a product team with Agile mindset
professional experience:
- Freelance PHP developer during university (Electrical engineering)
- Software engineer in ZORAQ (startup, 3 years) and SAFA(mid level organization, 1 year)
- Team lead at ZORAQ (2 years, C#, Microsoft technologies)
- Founder at Parvazhub and HotelHub, created everything (2 years Ruby on Rails, UI, code, devops)
- Software developer at Binary.com (1 year, Perl, Postgress, Bash)
I wrote about all of this and more in my [one page website](https://alideishidi.com).

Q2. Please check the code. Here is some notes about the code:
- `ObjectRecord` class is a simple class to store and retrieve objects. The interface is like `ActiveRecord`. Each model that inherit from this class would be able to store its objects.
- To check`Feed` class in action please see its [correspondent test](test/feed_test.rb). To brings more readability I didn't use 'Faker' in tests. Also `refresh` method is implemented. Simply it uses `Find_by` method with ranges for `created_at` attribute (form the last `retrieve` until `now`)
- Run tests with `rake test`
- See [example](example.rb) for usage


Q3. Please check [Financial services](lib/financial_services.rb). I use Factory pattern to create new objects for each gateway and inject it into `FinancialServices` class. See [test](test/financial_services_test.rb) for the usage



Q4. Probably I will use Collaborative based filtering. However I think Content based filtering would be applicable if we can have abstraction of each book. To produce the recommendation, the matrix of User, Book should be populated. Each element of this matrix is 1 (upvoted) or empty. By using Pearson correlation we can find most simillar user to our target.
Then based on most simillar users, we can generate average numbers for each book for target user. Then we will findout the favourite genre of target user (by looking into his upvoted books) and the recommendation books list would be sorted by favourite genre and followed authors.
In conclusion, we have to find most simillar user to our target. Calculate most probable books based on that user. Sort based on his/her genre and author, and propose the list to target.
Note: I am not an expert on ML or recommendations. This is my understaning of how should it be done :)
