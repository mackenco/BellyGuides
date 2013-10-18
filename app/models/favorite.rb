class Favorite < ActiveRecord::Base
  attr_accessible :map_id, :user_id, :map, :user
  validates :map_id, :user_id, presence: true

  belongs_to :map
  belongs_to :user
end
