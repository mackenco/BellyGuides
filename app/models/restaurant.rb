class Restaurant < ActiveRecord::Base
  attr_accessible :completed, :latitude, :longitude, :map_id, :name,
                    :note, :source_url, :address, :map

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



end
