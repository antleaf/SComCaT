class AdoptionLevel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :technologies
end
