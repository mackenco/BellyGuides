class Restaurant < ActiveRecord::Base
  attr_accessible :completed, :lat, :long, :map_id, :name, :note, :source_url

  belongs_to(
    :map,
    class_name: "Map",
    foreign_key: :map_id,
    primary_key: :id)
end
