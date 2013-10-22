colin = User.create({ username: "Colin", password: "password",
                      email: "colinwmackenzie@gmail.com",
                      profile_pic:                                                                    File.new("public/images/seeds/colin-mackenzie.jpg") })
colin2 = User.create({ username: "Colin2", password: "password",
                       email: "colinwmackenzie@gmail.com",
                       profile_pic:                                                                    File.new("public/images/seeds/colin-mackenzie.jpg") })
laura = User.create({ username: "Laura", password: "password",
                      email: "colinwmackenzie@gmail.com",
                      profile_pic: File.new("public/images/seeds/laura.png") })
guest = User.create({ username: "Guest", password: "guest_password",
                      email: "colinwmackenzie@gmail.com",
                      profile_pic:                                                                    File.new("public/images/seeds/Michelin-man.jpg") })
triage = User.create({ username: "Triage", password: "triage",
                      email: "colinwmackenzie@gmail.com",
                      profile_pic:                                                                    File.new("public/images/seeds/triage.png") })

map1 = Map.create({ title: "App Academy Lunch Spots", owner: colin,
      description: "Some places to eat around App Academy."})
map2 = Map.create({ title: "Where to eat in Williamsburg", owner: colin,
      description: "Here are some places to eat in Williamsburg." })
map4 = Map.create({ title: "New York Michelin Restaurants", owner: guest,
      description: "These New York restaurants received 3 stars in the upcoming                     2014 Michelin Guide. Wow!"})
map5 = Map.create({ title: "Where to eat in Atlanta", owner: triage,
      description: "Colins picks the best Atl eats"})

Favorite.create([{ user: colin, map: map4}, { user: colin, map: map5},
                 { user: colin2, map: map1},
                 { user: colin2, map: map5}, { user: guest, map: map2},
                 { user: guest, map: map5},  { user: laura, map: map5},
                 { user: laura, map: map1}])

Comment.create([{ author: colin , map: map5, text: "What a great map"},
  { author: colin , map: map4, text: "Hoping to check these places out!"},
  { author: colin , map: map1, text: "Luke's lobster is great"},
  { author: colin , map: map2, text: "Oddfellows is amazing"}])

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
    source_url: "http://www.venierospastry.com/",
    map: map1, latitude: 40.7295, longitude: -73.9845,
    address: "342 E 11th St New York, NY 10003",
    place_type: "bakery", place_type_display: "Bakery" },

  { name: "Pommes Frites", completed: false, note: "Delicious french fries!",
    source_url: "http://www.yelp.com/biz/pommes-frites-new-york",
    map: map1, latitude: 40.7283, longitude: -73.9883,
    address: "123 2nd Ave, New York, NY 10003",
    place_type: "restaurant", place_type_display: "Restaurant" },

  { name: "Kati Roll", completed: false, note: "Delicious rolls",
    source_url: "http://www.yelp.com/biz/the-kati-roll-company-new-york",
    map: map1, latitude: 40.7298, longitude: -74.0007,
    address: "99 MacDougal St New York, NY 10012",
    place_type: "fast-food", place_type_display: "Fast Food" },

  { name: "BrisketTown", completed: true, note: "Delicious brisket",
    source_url: "http://www.yelp.com/biz/briskettown-brooklyn-3",
    map: map2, latitude: 40.7115, longitude: -73.9629,
    address: "359 Bedford Ave Brooklyn, NY 11211",
    place_type: "slaughterhouse", place_type_display: "Barbecue" },

  { name: "Saltie", completed: false, note: "Delicious sandwiches",
    source_url: "http://www.yelp.com/biz/saltie-brooklyn",
    map: map2, latitude: 40.7138, longitude: -73.9555,
    address: "378 Metropolitan Ave Brooklyn, NY 11211",
    place_type: "bakery", place_type_display: "Bakery" },

  { name: "OddFellows Ice Cream Co.", completed: false,
    note: "Delicious ice cream",
    source_url: "http://www.yelp.com/biz/oddfellows-ice-cream-co-brooklyn-2",
    map: map2, latitude: 40.7181, longitude: -73.9637,
    address: "175 Kent Ave Brooklyn, NY 11249",
    place_type: "cafe", place_type_display: "Restaurant" },

  { name: "Radegast Hall and Biergarten", completed: true,
    note: "Delicious beer",
    source_url: "http://www.yelp.com/biz/radegast-hall-and-biergarten-brooklyn",
    map: map2, latitude: 40.7165, longitude: -73.9616,
    address: "113 N 3rd St Brooklyn, NY 11249",
    place_type: "alcohol-shop", place_type_display: "Brewery" },

  { name: "Chef's Table at Brooklyn Fare", completed: false,
    note: "24 course set menu\r\n No cellphones allowed!",
    source_url:                                                                       "http://ny.eater.com/archives/2013/10/michelin_stars_new_york_2014.php",
    map: map4, latitude: 40.6886328, longitude: -73.9851684,
    address: "200 Schermerhorn Street, Brooklyn, NY 11201, USA",

    place_type: "restaurant", place_type_display: "Restaurant"},
  { name: "Masa", completed: true,
    note: "One of the most expensive restaurants in the world.",
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
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Cypress Street Pint & Plate", completed: false,
    note: "Atl's most underrated bar - tons of weird beers on taps that               turnover seemingly weekly. Also once I won trivia, #neverforget",
    source_url: "http://cypressbar.com/",
    map: map5, latitude: 33.7769474, longitude: -84.3872833,
    address:
      "817 West Peachtree Street Northwest a100, Atlanta, GA 30308, USA",           place_type: "bar", place_type_display: "Bar"},

  { name: "Heirloom Market BBQ", completed: false,
    note: "I will fight anyone who disagrees that this is the bet BBQ in Atl",      source_url: "http://www.heirloommarketbbq.com/", map: map5,
    latitude: 33.898726, longitude: -84.447102,
    address: "2243 Akers Mill Road Southeast, Atlanta, GA 30339, USA",              place_type: "slaughterhouse", place_type_display: "Barbecue"},

  { name: "Antico Pizza", completed: true,
    note:
      "Not breaking any ground with this pick but...whatever, it's amazing",
    source_url: "http://www.anticoatl.com/", map: map5,
    latitude: 33.784655, longitude: -84.405647,
    address: "1093 Hemphill Avenue Northwest, Atlanta, GA 30318, USA",              place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Woody's Cheesesteak ", completed: true,
    note: "The cheesesteaks are good and reportedly taste better when you             drink? I can't comment. ",
    source_url: "https://www.facebook.com/WoodysCheesesteaks", map: map5,           latitude: 33.780946, longitude: -84.368634,
    address: "981 Monroe Drive Northeast, Atlanta, GA 30308, USA",
    place_type: "fast-food", place_type_display: "Fast Food"},

  { name: "Crawfish Shack Seafood", completed: true,
    note: "Your hands will smell like shrimp for days, but it's worth it",          source_url: "http://www.crawfishshackseafood.com/", map: map5,
    latitude: 33.868231, longitude: -84.299858,
    address: "4337 Buford Highway, Atlanta, GA 30341, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Brick Store Pub", completed: false,
    note: "Consistently rated as one of the best bars in America for a reason",     source_url: "http://www.brickstorepub.com/home/", map: map5,
    latitude: 33.774984, longitude: -84.296174,
    address: "125 E Court Square, Decatur, GA 30030, USA",
    place_type: "alcohol-shop", place_type_display: "Brewery"},

  { name: "The Optimist", completed: false,
    note: "Prices not for the faint of heart, but possibly the best yeast rolls       around ",
    source_url: "http://theoptimistrestaurant.com/", map: map5,
    latitude: 33.7797192, longitude: -84.410287,
    address: "910-914 Howell Mill Road Northwest, Atlanta, GA 30318, USA",          place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Gu's Bistro", completed: true,
    note: "Might I suggest you bring 40 friends and order everything?",             source_url: "http://gusbistro.com/", map: map5,
    latitude: 33.9076758, longitude: -84.2683332,
    address: "5644-5778 Georgia 13, Doraville, GA 30340, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Taqueria el Rey del Taco", completed: true,
    note: "Authentic, amazing, grungy, grimy tacos ",
    source_url: "http://www.taqueriaelreydeltaco.com/", map: map5,
    latitude: 33.897138, longitude: -84.282098,
    address: "5288 Buford Highway Northeast, Pinetree West Shopping Center,           Doraville, GA 30340, USA",
    place_type: "restaurant", place_type_display: "Restaurant"},

  { name: "Taco Bell", completed: false,
    note: "This Mexican-American gem often slips under peoples' radars!",           source_url: "http://www.yelp.com/biz/taco-bell-atlanta-4", map: map5,           latitude: 33.772579, longitude: -84.373073,
    address: "429 Ponce De Leon Avenue Northeast, Atlanta, GA 30308, USA",          place_type: "fast-food", place_type_display: "Fast Food"},

  { name: "Your Dekalb Farmer's Market", completed: false, note: "Worth the           trek for 25 varieties of mushrooms and dirt cheap bulk spices ",
    source_url: "http://www.dekalbfarmersmarket.com/", map: map5,
    latitude: 33.7866148, longitude: -84.2696257,
    address: "3000 East Ponce De Leon Avenue, Decatur, GA 30030, USA",              place_type: "grocery", place_type_display: "Grocery"},

  { name: "Star Provisions", completed: true,
    note: "Amazing sandwiches and (controversial statement alert) best fried          chicken in town",
    source_url: "http://www.starprovisions.com/star-provisions.php", map: map5,     latitude: 33.7869401, longitude: -84.411763,
    address: "1196-1200 Howell Mill Road Northwest, Atlanta, GA 30318, USA",        place_type: "bakery", place_type_display: "Bakery"},

  { name: "Morelli's Ice Cream", completed: false,
    note: "Atl's best ice cream",
    source_url: "http://www.morellisicecream.com/", map: map5,
    latitude: 33.733595, longitude: -84.349975,
    address: "749 Moreland Avenue Southeast, Atlanta, GA 30316, USA",               place_type: "cafe", place_type_display: "Cafe"}
  ])