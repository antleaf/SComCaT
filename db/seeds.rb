# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'

admin_role = Role.create(
    name: 'Admin',
    description: 'Full administration rights'
)

edit_role = Role.create(
    name: 'Editor',
    description: 'Can edit but not delete records'
)

helpdesk_role = Role.create(
    name: 'Helpdesk',
    description: 'Receives and handles feedback from users'
)

# user = User.new
# user.email = ''
# user.forenames = ''
# user.lastname = ''
# user.password = ''
# user.password_confirmation = ''
# user.roles << admin_role
# user.roles << edit_role
# user.roles << helpdesk_role
# user.save!
