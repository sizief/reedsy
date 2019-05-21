## ActiveRecord like ability without database

- `ObjectRecord` class is a simple class to store and retrieve objects. The interface is like `ActiveRecord`. Each model that inherit from this class would be able to store its objects.
- To check`Feed` class in action please see its [correspondent test](test/feed_test.rb). To brings more readability I didn't use 'Faker' in tests. Also `refresh` method is implemented. Simply it uses `Find_by` method with ranges for `created_at` attribute (form the last `retrieve` until `now`)
- Run tests with `rake test`
- See [example](example.rb) for usage
