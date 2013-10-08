# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

colin = User.create({username: "Colin", password: "pw"})
map = Map.create({ title: "App Academy Lunch Spots", owner: colin,
      description: "Some places to eat around App Academy"})

Restaurant.create([
  { name: "Russ & Daughters", completed: false, note: "Delicious bagels",
    source_url: "http://www.yelp.com/biz/russ-and-daughters-new-york",
    map: map, latitude: 40.7226, longitude: -73.9883,
    address: "179 E Houston St  New York, NY 10002" },
  { name: "Luke's Lobster", completed: false, note: "Delicious lobster!",
    source_url: "http://www.yelp.com/biz/lukes-lobster-new-york",
    map: map, latitude: 40.7268, longitude: -73.9852,
    address: "93 E 7th St, New York, NY 10009" },
  { name: "Num Pang", completed: true, note: "Delicious sandwiches!",
    source_url: "http://www.yelp.com/biz/num-pang-new-york-2",
    map: map, latitude: 40.7341, longitude: -73.9932,
    address: "21 E 12th St, New York, NY 10003" },
  { name: "Veniero's Pastry Shop", completed: false, note: "Delicious cookies!",
    source_url: "http://www.yelp.com/biz/venieros-pastry-shop-new-yo...",
    map: map, latitude: 40.7295, longitude: -73.9845,
    address: "342 E 11th St New York, NY 10003" },
  { name: "Pommes Frites", completed: false, note: "Delicious french fries!",
    source_url: "http://www.yelp.com/biz/pommes-frites-new-york",
    map: map, latitude: 40.7283, longitude: -73.9883,
    address: "123 2nd Ave, New York, NY 10003" },
  { name: "Kati Roll", completed: false, note: "Delicious rolls",
    source_url: "http://www.yelp.com/biz/the-kati-roll-company-new-y...",
    map: map, latitude: 40.7298, longitude: -74.0007,
    address: "99 MacDougal St New York, NY 10012" }
  ])