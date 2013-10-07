class Restaurant < ActiveRecord::Base
  attr_accessible :completed, :lat, :long, :map_id, :name, :note, :source_url
end
