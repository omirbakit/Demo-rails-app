class Item < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  validates :name, presence: true
  validates :tag, presence: true
end
