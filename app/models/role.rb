class Role < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :assignments
  has_many :users, through: :assignments

  validates :name, presence: true, uniqueness: true
end
