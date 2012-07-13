# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
require 'populator'

Page.populate(20) do |page|
  page.title = Faker::Lorem.sentence(6)
  page.content = Faker::Lorem.sentences(3)
  page.published_on = 1.year.ago..Time.now
  page.created_at = 1.year.ago..Time.now
  page.updated_at = 1.year.ago..Time.now
end

Page.populate(10) do |page|
  page.title = Faker::Lorem.sentence(6)
  page.content = Faker::Lorem.sentences(3)
  page.created_at = 1.year.ago..Time.now
  page.updated_at = 1.year.ago..Time.now
end