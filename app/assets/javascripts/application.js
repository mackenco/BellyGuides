// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require jquery.serializeJSON
//= require belly_guide
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .
$(document).ready(function() {

  $("#comment-form").on("ajax:success", function(event, data){
        $(".comments").prepend(data);
        $("#comment-form textarea").val("");
  })

 $(".fav-count").on("click", function() {
   $('.fav-list').toggleClass('hide');
 })

 var bakery = $('#filter-bakery')
 var bar = $('#filter-bar')
 var alcohol_shop = $('#filter-alcohol-shop')
 var cafe = $('#filter-cafe')
 var fast_food = $('#filter-fast-food')
 var grocery = $('#filter-grocery')
 var restaurant = $('#filter-restaurant')
 var slaughterhouse = $('#filter-slaughterhouse')

 var items = [bakery, bar, alcohol_shop, cafe,
              fast_food, grocery, restaurant, slaughterhouse]
 var symbols = ['bakery', 'bar', 'alcohol-shop', 'cafe',
             'fast-food', 'grocery', 'restaurant', 'slaughterhouse']

 var all = $('#filter-all')

 _(items).each(function (item, index) {
   item.on('click', function(e) {
     all.removeClass();
     _(items).each(function(item){ item.removeClass() })
     item.addClass('active')
     map.markerLayer.setFilter(function(f) {
       return f.properties['marker-symbol'] === symbols[index]
     });
     return false
   })
 })

 all.on('click', function() {
   _(items).each(function(item) { item.removeClass() })
   all.addClass('active')
   map.markerLayer.setFilter(function(f) {
     return true;
   });
   return false;
 });

 var compress = document.getElementById('compress')
 compress.onclick = function(e) {
   $item = $(e.currentTarget)
   $item.siblings().toggleClass('hide')
 }

})
