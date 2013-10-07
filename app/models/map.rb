class Map < ActiveRecord::Base
  attr_accessible :owner_id, :title

  belongs_to
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
end
