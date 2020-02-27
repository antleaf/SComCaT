class Technology < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_taggable

  belongs_to :adoption_level
  belongs_to :readiness_level
  has_and_belongs_to_many :functions
  has_and_belongs_to_many :categories

  #has_many :subjects, class_name: 'Relationship', foreign_key: 'subject_id'
  #has_many :objects, class_name: 'Relationship', foreign_key: 'object_id'
end
