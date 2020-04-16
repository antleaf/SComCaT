# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'
require './db/remote_google_data'


CSV_PARSING_OPTIONS = {:headers=>true,:encoding=>'UTF-8'}
SIMPLE_MODELS = ['Function','AdoptionLevel','ReadinessLevel','Category','Governance']
CSV_DATA_ROOT = "#{File.dirname(__FILE__)}/seed_data"

# download_all_google_data(CSV_DATA_ROOT)

SIMPLE_MODELS.each do |model|
  puts "Seeding #{model}...."
  CSV.open("#{CSV_DATA_ROOT}/#{model}.csv", CSV_PARSING_OPTIONS).each do |row|
    eval(model).create(
        slug: row['slug'],
        name: row['name'],
        description: row['description'],
        notes: row['notes']
    )
  end
  puts "#{model} seeded OK"
  puts
end

puts "Seeding Technologies...."
CSV.open("#{CSV_DATA_ROOT}/Technology.csv", CSV_PARSING_OPTIONS).each do |row|
  technology = Technology.create(
      slug: row['slug'],
      name: row['name'],
      url: row['url'],
      description: row['description'],
      notes: row['notes'],
      adoption_level: AdoptionLevel.friendly.find(row['adoption_level']),
      readiness_level: ReadinessLevel.friendly.find(row['technology_readiness']),
      governance: Governance.friendly.find(row['governance'])
  )
  technology.tag_list.add(row['tags'], parse: true)
  technology.save
end
puts "Technologies seeded OK"
puts

puts "Seeding Join table TechnologyFunction..."

CSV.open("#{CSV_DATA_ROOT}/TechnologyFunction.csv", CSV_PARSING_OPTIONS).each do |row|
  Technology.friendly.find(row['technology_id']).functions << Function.friendly.find(row['function_id'])
end

puts "Seeding Join table TechnologyCategory..."
CSV.open("#{CSV_DATA_ROOT}/TechnologyCategory.csv", CSV_PARSING_OPTIONS).each do |row|
  Technology.friendly.find(row['technology_id']).categories << Category.friendly.find(row['category_id'])
end

puts "Join tables seeded OK"
puts

puts "Seeding Relationships..."
CSV.open("#{CSV_DATA_ROOT}/Relationship.csv", CSV_PARSING_OPTIONS).each do |row|
  Relationship.create(
      subj: Technology.friendly.find(row['subj']),
      obj: Technology.friendly.find(row['obj']),
      predicate: row['predicate']
  )
end

puts "Relationships seeded OK"
puts

admin_role = Role.create(:name => 'admin', :description => 'Full administration rights')
edit_role = Role.create(:name => 'editor', :description => 'Can edit (but) not delete records')

user = User.new
user.email = ENV["ADMIN_ACCOUNT_EMAIL"]
user.password = ENV["ADMIN_ACCOUNT_PASSWORD"]
user.password_confirmation = ENV["ADMIN_ACCOUNT_PASSWORD"]
user.roles << admin_role
user.roles << edit_role
user.save!
