# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'
require './db/remote_google_data'


CSV_PARSING_OPTIONS = {:headers=>true,:encoding=>'UTF-8'}
SIMPLE_MODELS = ['Function','AdoptionLevel','ReadinessLevel','Category']
CSV_DATA_ROOT = "#{File.dirname(__FILE__)}/seed_data"

# download_all_google_data(CSV_DATA_ROOT)

SIMPLE_MODELS.each do |model|
  puts "Seeding #{model}...."
  CSV.open("#{CSV_DATA_ROOT}/#{model}.csv", CSV_PARSING_OPTIONS).each do |row|
    eval(model).create(
        slug: row['ID'],
        name: row['Name'],
        description: row['Description'],
        notes: row['Notes']
    )
  end
  puts "#{model} seeded OK"
  puts
end

CSV.open("#{CSV_DATA_ROOT}/Technology.csv", CSV_PARSING_OPTIONS).each do |row|
  technology = Technology.create(
      slug: row['ID'],
      name: row['Name'],
      url: row['URL'],
      description: row['Description'],
      notes: row['Notes'],
      adoption_level: AdoptionLevel.friendly.find(row['Adoption_Level']),
      readiness_level: ReadinessLevel.friendly.find(row['Technology_Readiness'])
  )
  technology.tag_list.add(row['Tags'], parse: true)
end

CSV.open("#{CSV_DATA_ROOT}/TechnologyFunction.csv", CSV_PARSING_OPTIONS).each do |row|
  Technology.friendly.find(row['Technology_ID']).functions << Function.friendly.find(row['Function_ID'])
end

CSV.open("#{CSV_DATA_ROOT}/TechnologyCategory.csv", CSV_PARSING_OPTIONS).each do |row|
  Technology.friendly.find(row['Technology_ID']).categories << Category.friendly.find(row['Category_ID'])
end

# CSV.open("#{CSV_DATA_ROOT}/Relationships.csv", CSV_PARSING_OPTIONS).each do |row|
#   parent_technology = Technology.friendly.find(row['Related_Technology_ID'])
#   child_technology = Technology.friendly.find(row['Technology_ID'])
# end

user = User.new
user.email = 'paul@paulwalk.net'
user.password = 'what3v3r'
user.password_confirmation = 'what3v3r'
user.save!