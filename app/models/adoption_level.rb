class AdoptionLevel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  include GenerateCsv
  audited

  has_many :technologies
end
