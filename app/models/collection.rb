class Collection < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited

  has_and_belongs_to_many :technologies

  default_scope { order(name: :asc) }
end
