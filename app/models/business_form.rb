class BusinessForm < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited

  has_many :technologies

end
