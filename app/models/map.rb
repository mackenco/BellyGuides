class Map < ActiveRecord::Base
  attr_accessible :owner_id, :title, :description, :owner, :restaurants_attributes

  validates :title, presence: { message: "Map title can't be blank" }
  validates :description, presence: { message: "Map description can't be blank" }

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id)

  has_many(
    :restaurants,
    class_name: "Restaurant",
    foreign_key: :map_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :favorites

  has_many :favorited_users, through: :favorites, source: :user

  has_many :comments

  extend FriendlyId
  friendly_id :title, use: :slugged

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :restaurants,
  :reject_if => lambda { |a| a[:content].blank? }, allow_destroy: true
end
