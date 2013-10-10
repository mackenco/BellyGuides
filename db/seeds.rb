colin = User.create({ username: "Colin", password: "pw",
                      email: "colinwmackenzie@gmail.com" })
colin2 = User.create({ username: "Colin2", password: "pw",
                       email: "colinwmackenzie@gmail.com" })
laura = User.create({ username: "Laura", password: "pw",
                      email: "colinwmackenzie@gmail.com" })

map1 = Map.create({ title: "App Academy Lunch Spots", owner: colin,
      description: "Some places to eat around App Academy."})
map2 = Map.create({ title: "Where to eat in Williamsburg", owner: colin,
      description: "Here are some places to eat in Williamsburg." })

Restaurant.create([
  { name: "Russ & Daughters", completed: false, note: "Delicious bagels",
    source_url: "http://www.yelp.com/biz/russ-and-daughters-new-york",
    map: map1, latitude: 40.7226, longitude: -73.9883,
    address: "179 E Houston St  New York, NY 10002" },
  { name: "Luke's Lobster", completed: false, note: "Delicious lobster!",
    source_url: "http://www.yelp.com/biz/lukes-lobster-new-york",
    map: map1, latitude: 40.7268, longitude: -73.9852,
    address: "93 E 7th St, New York, NY 10009" },
  { name: "Num Pang", completed: true, note: "Delicious sandwiches!",
    source_url: "http://www.yelp.com/biz/num-pang-new-york-2",
    map: map1, latitude: 40.7341, longitude: -73.9932,
    address: "21 E 12th St, New York, NY 10003" },
  { name: "Veniero's Pastry Shop", completed: false, note: "Delicious cookies!",
    source_url: "http://www.yelp.com/biz/venieros-pastry-shop-new-yo...",
    map: map1, latitude: 40.7295, longitude: -73.9845,
    address: "342 E 11th St New York, NY 10003" },
  { name: "Pommes Frites", completed: false, note: "Delicious french fries!",
    source_url: "http://www.yelp.com/biz/pommes-frites-new-york",
    map: map1, latitude: 40.7283, longitude: -73.9883,
    address: "123 2nd Ave, New York, NY 10003" },
  { name: "Kati Roll", completed: false, note: "Delicious rolls",
    source_url: "http://www.yelp.com/biz/the-kati-roll-company-new-y...",
    map: map1, latitude: 40.7298, longitude: -74.0007,
    address: "99 MacDougal St New York, NY 10012" },
  { name: "Briskettown", completed: true, note: "Delicious brisket",
    source_url: "http://www.yelp.com/biz/briskettown-brooklyn-3",
    map: map2, latitude: 40.7115, longitude: -73.9629,
    address: "359 Bedford Ave Brooklyn, NY 11211" },
  { name: "Saltie", completed: false, note: "Delicious sandwiches",
    source_url: "http://www.yelp.com/biz/saltie-brooklyn",
    map: map2, latitude: 40.7138, longitude: -73.9555,
    address: "378 Metropolitan Ave Brooklyn, NY 11211" },
  { name: "OddFellows Ice Cream Co.", completed: false, note: "Delicious ice cream",
    source_url: "http://www.yelp.com/biz/oddfellows-ice-cream-co-bro...",
    map: map2, latitude: 40.7181, longitude: -73.9637,
    address: "175 Kent Ave Brooklyn, NY 11249" },
  { name: "Radegast Hall and Biergarten", completed: true, note: "Delicious beer",
    source_url: "http://www.yelp.com/biz/radegast-hall-and-biergarte...",
    map: map2, latitude: 40.7165, longitude: -73.9616,
    address: "113 N 3rd St Brooklyn, NY 11249" }
   ])