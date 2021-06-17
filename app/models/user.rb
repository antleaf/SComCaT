class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments

  audited max_audits: 50

  # extend FriendlyId
  # friendly_id :email

  def display_name
    "#{forenames} #{lastname}"
  end

  def has_role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

  def self.dump_to_json(records=all)
    output_array = []
    records.each do |record|
      output_hash = {}
      output_hash['email'] = record.email
      output_hash['roles'] = record.roles.collect { |role| role.name }
      output_array << output_hash
    end
    output_array.to_json
  end

  def self.dump_to_csv(records=all)
    CSV.generate(headers: true) do |csv|
      csv << ['email','roles']
      records.each do |record|
        row = []
        row << record.email
        row << record.roles.collect { |role| role.name }.join('|')
        csv << row
      end
    end
  end
end
