class Governance < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited

  has_many :technologies

  default_scope { order(name: :asc) }

end
