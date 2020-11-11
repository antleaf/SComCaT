class Dependency < ApplicationRecord
  belongs_to :technology
  belongs_to :dependee, class_name: 'Technology'
end
