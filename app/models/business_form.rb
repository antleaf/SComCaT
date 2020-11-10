class BusinessForm < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited max_audits: 50

  has_many :technologies

end
