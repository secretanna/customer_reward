Here are some explanation on how to use this repo:
Please, go to the main derictory
```
backend
```
First, run 
```
bundle install
```
To initialize the db
```
SCHEMA=db/schema.rb bundle exec rake db:create
SCHEMA=db/schema.rb bundle exec rake db:migrate
```
Once this is done, you can run the main.rb file. There you can find a usage example of RewardFinder. It will return a result for one customer from customer_purchases list.

```
bundle exec ruby core/main.rb
```
Now, you can play around, changing the seed data.

I feel like need to explain some of my decisions and overall the approach.

I decided to move with the thought of: why not having rewards as DB records. That way we actually can add them as many as we want. And I couldn't imagine a reward system that
can not be "translated" into SQL language. So adding new rules are as simple as creating of AR record - this is why you don't see a special creator for this. I didn't sanitize the sql code there assuming it's only internal usage and it won't be created via API, for instance. Although I left
some space for another apporach (if any). This is why you see CustomerRewards::BasicFinder. The actual handling of both systems I left out of context, there're many ways how to do it. 
The idea was to keep the implimentation as simple as possible. For me it was important to show the overall idea. Of course there're some things to improve - DB connection, SQL sanitising,
more tests, performance imrpovments, parallel execution etc. Assuming it should take several hours to create (which i did), I didn't dive in all those problems. We can discuss them all
afterwards.

Thank you for reading it, will appriciate your feedback 🙇‍♀️
