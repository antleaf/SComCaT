class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  include GenerateCsv

  has_and_belongs_to_many :technologies

  default_scope { order(name: :asc) }
end
