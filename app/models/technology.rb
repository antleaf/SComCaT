class Technology < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_taggable
  acts_as_taggable_on :base_techs
  audited max_audits: 500

  belongs_to :status
  belongs_to :business_form
  belongs_to :adoption_level
  belongs_to :readiness_level
  belongs_to :governance
  belongs_to :editorial_state
  has_and_belongs_to_many :functions
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :collections

  has_many :dependencies, dependent: :destroy
  has_many :dependees, through: :dependencies

  scope :published, -> { where(editorial_state: EditorialState.friendly.find('published')) }
  scope :draft, -> { where(editorial_state: EditorialState.friendly.find('draft')) }
  default_scope {where(editorial_state: EditorialState.friendly.find('published'))}

  def is_depended_on_by
    technology_list = []
    Dependency.where(:dependee => self).each {|d| technology_list << d.technology}
    return technology_list
  end

  def self.dump_to_json(technologies=published)
    tech_array = []
    technologies.each do |technology|
      tech = {}
      tech['id'] = technology.slug
      tech['name'] = technology.name
      tech['last_updated'] = technology.updated_at.strftime('%Y-%m-%d %H:%M UTC')
      tech['description'] = technology.description
      tech['homepage'] = technology.url
      tech['codebase'] = technology.codebase
      tech['roadmap'] = technology.roadmap
      tech['hosting'] = technology.hosting
      tech['pricing'] = technology.pricing
      tech['licensing'] = technology.licensing
      tech['adoption_level'] = technology.adoption_level.name
      tech['readiness_level'] = technology.readiness_level.name
      tech['governance'] = technology.governance.name
      tech['status'] = technology.status.name
      tech['business_form'] = technology.business_form.name
      tech['categories'] = technology.categories.collect { |category| category.name }
      tech['functions'] = technology.functions.collect { |function| function.name }
      tech['collections'] = technology.collections.collect { |collection| collection.name }
      tech['base_technologies'] = technology.base_techs.collect { |base_tech| base_tech.name }
      tech['tags'] = technology.tags.collect { |tag| tag.name }
      tech['is_depended_on_by'] = technology.is_depended_on_by.collect { |child_tech| child_tech.slug }
      tech['depends_on'] = technology.dependees.collect { |parent_tech| parent_tech.slug }
      tech_array << tech
    end
    tech_array.to_json
  end

  def self.dump_to_csv(technologies=published)
    CSV.generate(headers: true) do |csv|
      csv << ['id','name','description','last_updated','homepage','codebase','roadmap','hosting','pricing','licensing','adoption_level','readiness_level','governance','status','business_form','categories','collections','functions','base_technologies','tags','is_depended_on_by','depends_on']
      technologies.each do |technology|
        row = []
        row << technology.slug
        row << technology.name
        row << technology.description
        row << technology.updated_at.strftime('%Y-%m-%d %H:%M UTC')
        row << technology.url
        row << technology.codebase
        row << technology.roadmap
        row << technology.hosting
        row << technology.pricing
        row << technology.licensing
        row << technology.adoption_level.name
        row << technology.readiness_level.name
        row << technology.governance.name
        row << technology.status.name
        row << technology.business_form.name
        row << technology.categories.collect { |category| category.name }.join('|')
        row << technology.collections.collect { |collection| collection.name }.join('|')
        row << technology.functions.collect { |function| function.name }.join('|')
        row << technology.base_techs.collect { |base_tech| base_tech.name }.join('|')
        row << technology.tags.collect { |tag| tag.name }.join('|')
        row << technology.is_depended_on_by.collect { |tech| tech.slug }.join('|')
        row << technology.dependees.collect { |tech| tech.slug }.join('|')
        csv << row
      end
    end
  end
end
