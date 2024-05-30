class Collection < ApplicationRecord
  belongs_to :user
  has_many :items
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
end
