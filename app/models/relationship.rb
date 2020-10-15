class Relationship < ApplicationRecord
  belongs_to :subj, class_name: 'Technology'
  belongs_to :obj, class_name: 'Technology'
  audited

  enum predicate: {
      depends_on: "depends_on"
  }

  def self.dump_to_json(records=all)
    output_array = []
    records.each do |record|
      output_hash = {}
      output_hash['subject'] = record.subj.slug
      output_hash['predicate'] = record.predicate
      output_hash['object'] = record.obj.slug
      output_array << output_hash
    end
    output_array.to_json
  end

  def self.dump_to_csv(records=all)
    CSV.generate(headers: true) do |csv|
      csv << ['subject','predicate','object']
      records.each do |record|
        row = []
        row << record.subj.slug
        row << record.predicate
        row << record.obj.slug
        csv << row
      end
    end
  end

end
