# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'
# require './db/remote_google_data'


CSV_PARSING_OPTIONS = {:headers=>true,:encoding=>'UTF-8'}
CSV_DATA_ROOT = "#{File.dirname(__FILE__)}/seed_data"

# models = [AdoptionLevel,Assignment,BusinessForm,Category,Function,Governance,ReadinessLevel,Relationship,Role,Status,Technology,User]

# models.each do |model|
#   CSV.open( "#{CSV_DATA_ROOT}/#{model.name}.csv", 'w' ) do |csv|
#     records = model.all
#     csv << records.first.attributes.map { |a,v| a }
#     records.each do |record|
#       csv << record.attributes.map { |a,v| v }
#     end
#   end
# end

# csv = CSV.parse(File.read("#{CSV_DATA_ROOT}/Assignment.csv"), :headers => true, :encoding => 'UTF-8')
# csv.each do |row|
#   puts row.to_hash
# end





# CSV.open("#{CSV_DATA_ROOT}/technologies.csv", CSV_PARSING_OPTIONS).each do |row|
#   tech = Technology.find(row['id'])
#   tech.adoption_level = AdoptionLevel.find_by_slug(row['adoption_level'])
#   tech.readiness_level = ReadinessLevel.find_by_slug(row['readiness_level'])
#   tech.status = Status.find_by_slug(row['status'])
#   tech.governance = Governance.find_by_slug(row['governance'])
#   tech.business_form = BusinessForm.find_by_slug(row['business_form'])
#   if row['base_tech_list']
#     tech.base_tech_list = row['base_tech_list'].strip
#   end
#   if row['functions']
#     tech.functions.destroy_all
#     row['functions'].split(',').each do |function_slug|
#       tech.functions << Function.find_by_slug(function_slug.strip)
#     end
#   end
#   if row['categories']
#     tech.categories.destroy_all
#     row['categories'].split(',').each do |category_slug|
#       tech.categories << Category.find_by_slug(category_slug.strip)
#     end
#   end
#   tech.hosting = row['hosting']
#   tech.url = row['url']
#   tech.description = row['description']
#   tech.pricing = row['pricing']
#   tech.roadmap = row['roadmap']
#   tech.licensing = row['licensing']
#   tech.codebase = row['codebase']
#   puts "saving #{tech.name}..."
#   tech.save!
# end


# user = User.new
# user.email = ENV["ADMIN_ACCOUNT_EMAIL"]
# user.password = ENV["ADMIN_ACCOUNT_PASSWORD"]
# user.password_confirmation = ENV["ADMIN_ACCOUNT_PASSWORD"]
# user.roles << admin_role
# user.roles << edit_role
# user.save!
