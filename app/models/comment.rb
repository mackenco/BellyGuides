class Comment < ActiveRecord::Base
  attr_accessible :map_id, :owner_id, :text, :map, :author

  validates :map_id, :owner_id, :text, presence: true

  belongs_to :map

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )
end
