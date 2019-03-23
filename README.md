# README

It consume the data from the given ENV['TREE_URI'] and process based Ancestry module. 

* HTTP GET /:tree_id
=> Return the saved structure
* HTTP GET /:tree_id/parent/:id
=> Return the list of parents IDs
* HTTP GET /:tree_id/child/:id
=> Return the list of childs
***

Above URL will return data based on requirment.

[Deployed HEROKU URL](https://thawing-ravine-34399.herokuapp.com/1)

All the time TREE_URI was fetching data with tree id=1 so. Its quite expected you'll get a result of - There is no tree with this tree id. Other than tree_id=1.
## Testing
Test by running rspec http://rspec.info/ 
> $ rspec spec/*.rb
with coverage COVERAGE=true rspec spec/*.rb
......

Finished in 4.46 seconds (files took 1.1 seconds to load)
6 examples, 0 failures
***

## What I have used 

- For debugging Pry gem
- For test Case rspec
- For coverage simplecov
- For HTTP request Faraday gem
- Under Production env PG gem but for devlopment mysql(optional)

## Can be implemented

- Ansestry gem for better result
- Caching can implemented but Heroku free hosting it was diff.
- FactoryGirl Can be implemented.
- I was not sure with parentIDs so i have returned full.



### Please take a look for Ansestry module for depth.
