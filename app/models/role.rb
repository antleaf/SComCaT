class Role < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :assignments
  has_many :users, through: :assignments

  validates :name, presence: true, uniqueness: true

  def self.dump_to_json(records=all)
    output_array = []
    records.each do |record|
      output_hash = {}
      output_hash['name'] = record.name
      output_hash['description'] = record.description
      output_hash['user_count'] = record.users.count
      output_array << output_hash
    end
    output_array.to_json
  end

  def self.dump_to_csv(records=all)
    CSV.generate(headers: true) do |csv|
      csv << ['id','name','description','user_count']
      records.each do |record|
        row = []
        row << record.name
        row << record.description
        row << record.users.count
        csv << row
      end
    end
  end
end
