class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited max_audits: 50

  has_and_belongs_to_many :technologies

  default_scope { order(name: :asc) }
end
