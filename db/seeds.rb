# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  AdminUser.create!(full_name: (ENV['FULLNAME']).to_s, email: (ENV['ADMIN_EMAIL']).to_s, password: (ENV['SEED_PASSWORD']).to_s, password_confirmation: (ENV['SEED_PASSWORD']).to_s)
end

if Rails.env.production?
  AdminUser.create!(full_name: Rails.application.credentials.production[:full_name].to_s, email: Rails.application.credentials.production[:admin_email].to_s,
                    password: Rails.application.credentials.production[:seed_password].to_s, password_confirmation: Rails.application.credentials.production[:seed_password].to_s)

  CompanyInformation.create!(company_name: "Ayunayene tour and travel")
end