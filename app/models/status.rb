class Status < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited

end
