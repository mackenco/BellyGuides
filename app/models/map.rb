class Map < ActiveRecord::Base
  attr_accessible :owner_id, :title, :description

  validates :title, :description, presence: true

  acts_as_gmappable

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id)

  has_many(
    :restaurants,
    class_name: "Restaurant",
    foreign_key: :map_id,
    primary_key: :id)
end
