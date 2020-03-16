class AdoptionLevel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  include GenerateCsv

  has_many :technologies
end
