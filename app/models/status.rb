class Status < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  audited

  has_many :technologies

  def self.dump_to_json(records=all)
    output_array = []
    records.each do |record|
      output_hash = {}
      output_hash['id'] = record.slug
      output_hash['name'] = record.name
      output_hash['description'] = record.description
      output_hash['technology_count'] = record.technologies.count
      output_array << output_hash
    end
    output_array.to_json
  end

  def self.dump_to_csv(records=all)
    CSV.generate(headers: true) do |csv|
      csv << ['id','name','description','technology_count']
      records.each do |record|
        row = []
        row << record.slug
        row << record.name
        row << record.description
        row << record.technologies.count
        csv << row
      end
    end
  end

end
