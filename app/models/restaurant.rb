class Restaurant < ActiveRecord::Base
  attr_accessible :completed, :latitude, :longitude, :map_id, :name,
                    :note, :source_url, :address, :map

  validates :name, :address, presence: true

  belongs_to(
    :map,
    class_name: "Map",
    foreign_key: :map_id,
    primary_key: :id)
end
