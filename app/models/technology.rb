class Technology < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_taggable

  belongs_to :adoption_level
  belongs_to :readiness_level
  has_and_belongs_to_many :functions
  has_and_belongs_to_many :categories
end
