require 'addressable/uri'

class Restaurant < ActiveRecord::Base
  PLACE_TYPE_DISPLAY = Hash[
    'bakery','Bakery',
    'bar', 'Bar',
    'alcohol-shop', 'Brewery',
    'cafe', 'Cafe',
    'fast-food', 'Fast Food',
    'grocery', 'Grocery',
    'restaurant', 'Restaurant',
    'slaughterhouse', 'Barbecue'
  ]

  attr_accessible :completed, :latitude, :longitude, :map_id, :name,
                    :note, :source_url, :address, :map, :place_type,                                :place_type_display

  validates :name, :address, presence: true

  validates :name, presence: { message: "Restaurant name can't be blank" }
  validates :address, presence: { message: "Restaurant address can't be blank" }

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  belongs_to(
    :map,
    class_name: "Map",
    foreign_key: :map_id,
    primary_key: :id
  )

  def convert_address()
    url = Addressable::URI.new(
      scheme: "https",
      host: "maps.googleapis.com",
      path: "/maps/api/geocode/json",
      query_values: {
        address: self.address,
        sensor: "false"
    }).to_s

    response = JSON.parse(RestClient.get(url))
    top_result = response["results"].first
    coords = top_result["geometry"]["location"].values_at("lat", "lng")

    self.latitude = coords[0]
    self.longitude = coords[1]
  end

  def place_type_display()
    self.place_type_display = PLACE_TYPE_DISPLAY[self.place_type]
  end
end
