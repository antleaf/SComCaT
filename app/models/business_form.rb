class BusinessForm < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited

end
