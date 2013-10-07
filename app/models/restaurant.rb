class Restaurant < ActiveRecord::Base
  attr_accessible :completed, :lat, :long, :map_id, :name, :note, :source_url, :address

  validates :name, :address, presence: true

  belongs_to(
    :map,
    class_name: "Map",
    foreign_key: :map_id,
    primary_key: :id)
end
