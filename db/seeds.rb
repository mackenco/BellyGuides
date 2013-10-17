colin = User.create({ username: "Colin", password: "pw",
                      email: "colinwmackenzie@gmail.com",
                      profile_pic:                                                                    File.new("public/images/seeds/colin-mackenzie.jpg") })
colin2 = User.create({ username: "Colin2", password: "pw",
                       email: "colinwmackenzie@gmail.com",
                       profile_pic:                                                                    File.new("public/images/seeds/colin-mackenzie.jpg") })
laura = User.create({ username: "Laura", password: "pw",
                      email: "colinwmackenzie@gmail.com",
                      profile_pic: File.new("public/images/seeds/laura.png") })
guest = User.create({ username: "Guest", password: "guest_password",
                      email: "colinwmackenzie@gmail.com",
                      profile_pic:                                                                    File.new("public/images/seeds/Michelin-man.jpg") })

map1 = Map.create({ title: "App Academy Lunch Spots", owner: colin,
      description: "Some places to eat around App Academy."})
map2 = Map.create({ title: "Where to eat in Williamsburg", owner: colin,
      description: "Here are some places to eat in Williamsburg." })
map3 = Map.create({ title: "Woody Allen Hot Spots", owner: laura,
      description: "Spots from diff. movies"})
map4 = Map.create({ title: "New York Michelin Restaurants", owner: guest,
      description: "These New York restaurants received 3 stars in the upcoming 2014 Michelin Guide. Wow!"})

Restaurant.create([
  { name: "Russ & Daughters", completed: false, note: "Delicious bagels",
    source_url: "http://www.yelp.com/biz/russ-and-daughters-new-york",
    map: map1, latitude: 40.7226, longitude: -73.9883,
    address: "179 E Houston St  New York, NY 10002",
    place_type: "cafe", place_type_display: "Cafe"},

  { name: "Luke's Lobster", completed: true, note: "Delicious lobster!",
    source_url: "http://www.yelp.com/biz/lukes-lobster-new-york",
    map: map1, latitude: 40.7268, longitude: -73.9852,
    address: "93 E 7th St, New York, NY 10009",
    place_type: "restaurant", place_type_display: "Restaurant" },

  { name: "Num Pang", completed: true, note: "Delicious sandwiches!",
    source_url: "http://www.yelp.com/biz/num-pang-new-york-2",
    map: map1, latitude: 40.7341, longitude: -73.9932,
    address: "21 E 12th St, New York, NY 10003",
    place_type: "restaurant", place_type_display: "Restaurant" },

  { name: "Veniero's Pastry Shop", completed: true, note: "Delicious cookies!",
    source_url: "http://www.yelp.com/biz/venieros-pastry-shop-new-yo...",
    map: map1, latitude: 40.7295, longitude: -73.9845,
    address: "342 E 11th St New York, NY 10003",
    place_type: "bakery", place_type_display: "Bakery" },

  { name: "Pommes Frites", completed: false, note: "Delicious french fries!",
    source_url: "http://www.yelp.com/biz/pommes-frites-new-york",
    map: map1, latitude: 40.7283, longitude: -73.9883,
    address: "123 2nd Ave, New York, NY 10003",
    place_type: "restaurant", place_type_display: "Restaurant" },

  { name: "Kati Roll", completed: false, note: "Delicious rolls",
    source_url: "http://www.yelp.com/biz/the-kati-roll-company-new-y...",
    map: map1, latitude: 40.7298, longitude: -74.0007,
    address: "99 MacDougal St New York, NY 10012",
    place_type: "fast-food", place_type_display: "Fast Food" },

  { name: "BrisketTown", completed: true, note: "Delicious brisket",
    source_url: "http://www.yelp.com/biz/briskettown-brooklyn-3",
    map: map2, latitude: 40.7115, longitude: -73.9629,
    address: "359 Bedford Ave Brooklyn, NY 11211",
    place_type: "slaughterhouse", place_type_display: "Steakhouse" },

  { name: "Saltie", completed: false, note: "Delicious sandwiches",
    source_url: "http://www.yelp.com/biz/saltie-brooklyn",
    map: map2, latitude: 40.7138, longitude: -73.9555,
    address: "378 Metropolitan Ave Brooklyn, NY 11211",
    place_type: "bakery", place_type_display: "Bakery" },

  { name: "OddFellows Ice Cream Co.", completed: false,
    note: "Delicious ice cream",
    source_url: "http://www.yelp.com/biz/oddfellows-ice-cream-co-bro...",
    map: map2, latitude: 40.7181, longitude: -73.9637,
    address: "175 Kent Ave Brooklyn, NY 11249",
    place_type: "cafe", place_type_display: "Restaurant" },

  { name: "Radegast Hall and Biergarten", completed: true,
    note: "Delicious beer",
    source_url: "http://www.yelp.com/biz/radegast-hall-and-biergarte...",
    map: map2, latitude: 40.7165, longitude: -73.9616,
    address: "113 N 3rd St Brooklyn, NY 11249",
    place_type: "alcohol-shop", place_type_display: "Brewery" },

  { name: "Hayden Planetarium", completed: false, note: "Manhattan - In
    Manhattan the planetarium serves as a much needed source of shelter for
    Woody Allen and Diane Keaton from the down pour outside.",
    source_url: "http://www.amnh.org/our-research/hayden-planetarium",
    map: map3, latitude: 40.782032, longitude: -73.9717188,
    address: "Central Park West at 79th Street, New York, NY 1002...",
    place_type: "bar", place_type_display: "Bar"},

  { name: "Pomander Walk", completed: false, note: "",
    source_url: "http://en.wikipedia.org/wiki/Pomander_Walk",
    map: map3, latitude: 40.7936606, longitude: -73.97344,
    address: "260 W 94 Street, New York, NY 10025 ",
    place_type: "bar", place_type_display: "Bar"},

  { name: "Chef's Table at Brooklyn Fare", completed: false,
    note: "24 course set menu\r\n No cellphones allowed!",
    source_url:                                                                       "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.6886328, longitude: -73.9851684,
    address: "200 Schermerhorn Street, Brooklyn, NY 11201, USA",

    place_type: "restaurant", place_type_display: "Restaurant"},
  { name: "Masa", completed: true,
    note: "One of the most expensive restaurants in the world...",
    source_url:                                                                       "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.7684153, longitude: -73.9827069,
    address: "10 Columbus Circle, New York, NY 10019, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Le Bernardin", completed: true, note: "Gotta try the tuna ",
    source_url:                                                                        "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.7615091, longitude: -73.9818845,
    address: "155 West 51st Street, New York, NY 10019, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Eleven Madison Park", completed: false,
    note: "Molecular gastronomy\r\n",
    source_url:                                                                        "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.7389765, longitude: -73.993259,
    address: "11 Madison Avenue, New York, NY 10010, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Per Se", completed: true, note: "-Thomas Keller\r\n-A big deal!!",
    source_url: "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.7684153, longitude: -73.9827069,
    address: "10 Columbus Circle, New York, NY 10019, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Jean Georges", completed: false, note: "Swanky!",
    source_url:                                                                        "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.769302, longitude: -73.981363,
    address: "1 Central Park West, New York, NY 10023, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Daniel", completed: false, note: "-Daniel Boulud",
    source_url:                                                                         "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.7669119, longitude: -73.9676797,
    address: "48-98 East 65th Street, New York, NY 10065, USA",
    place_type: "restaurant", place_type_display: "Restaurant"}
])