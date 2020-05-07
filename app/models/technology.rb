class Technology < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  include GenerateCsv
  acts_as_taggable
  acts_as_taggable_on :base_techs
  audited

  belongs_to :adoption_level
  belongs_to :readiness_level
  belongs_to :governance
  has_and_belongs_to_many :functions
  has_and_belongs_to_many :categories

  #has_many :subjects, class_name: 'Relationship', foreign_key: 'subject_id'
  #has_many :objects, class_name: 'Relationship', foreign_key: 'object_id'
  #
  def depends_on
    technology_list = []
    Relationship.where(:subj => self,:predicate => 'depends_on').each {|rel| technology_list << rel.obj}
    return technology_list
  end

  def is_depended_on_by
    technology_list = []
    Relationship.where(:obj => self,:predicate => 'depends_on').each {|rel| technology_list << rel.subj}
    return technology_list
  end
end
