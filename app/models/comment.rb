class Comment < ActiveRecord::Base
  attr_accessible :map_id, :owner_id, :text

  belongs_to :map

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )
end
