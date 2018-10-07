# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

num_records = 10


# Users creation
puts 'started loading Users data'
#User.reset_pk_sequence

num_records.times do |row|
  User.create(email: Faker::Internet.email,
    password: "123456789",
    password_confirmation: "123456789",
    perimission_level: Faker::Number.between(0, 1),
    name: Faker::Name.first_name,
    score: Faker::Number.between(1, 5))

  end

  #User.create(email:"assian@gmail.com",name: "davidgantua" , password: "123456789", password_confirmation: "123456789")

  puts 'finished loading Users data'

# AdmGroup creation
puts 'started loading adm_groups data'

#AdmGroup.reset_pk_sequence

num_records.times do |row|
  AdmGroup.create(user_id: Faker::Number.between(1, num_records),
              group_id: Faker::Number.between(1, num_records))
end

puts 'finished loading adm_groups data'



# Comments creation
puts 'started loading Comments data'
#Comment.reset_pk_sequence

num_records.times do |row|
  Comment.create(user_id: Faker::Number.between(1, num_records),
                  post_id: Faker::Number.between(1, num_records),
                 body: Faker::Community.quotes)
                 #Comment.create(body: "esto es un comentario del user 1", post_id:1, user_id: 2)
end

puts 'finished loading Comments data'

# Groups creation
puts 'started loading Groups data'
#Group.reset_pk_sequence

num_records.times do |row|
  Group.create(
    name: Faker::Team.name)
  end

  puts 'finished loading Groups data'

# GroupHasTag creation
puts 'started loading GroupHasTag data'
#GroupHasTag.reset_pk_sequence

num_records.times do |row|
  GroupHasTag.create(group_id: Faker::Number.between(1, num_records),
                 tag_id: Faker::Number.between(1, num_records))
end

puts 'finished loading GroupHasTag data'




# PostHasTag creation
puts 'started loading PostHasTag data'
#PostHasTag.reset_pk_sequence

num_records.times do |row|
  PostHasTag.create(post_id: Faker::Number.between(1, num_records),
                     tag_id: Faker::Number.between(1, num_records))
end

puts 'finished loading PostHasTag data'

# Posts creation
puts 'started loading Post data'
#Post.reset_pk_sequence

num_records.times do |row|
  Post.create(user_id: Faker::Number.between(1, num_records),
              title: Faker::Artist.name,
              body: Faker::Community.quotes,
              solicitud: Faker::Number.between(1, num_records) )
end

puts 'finished loading Post data'

# Records creation
puts 'started loading Records data'
#Record.reset_pk_sequence

num_records.times do |row|
  Record.create(user_id: Faker::Number.between(1, num_records),
                    service_id: Faker::Number.between(1, num_records))
end

puts 'finished loading Records data'


# ServiceHasUsers creation
puts 'started loading ServiceHasUsers data'
#ServiceHasUser.reset_pk_sequence

num_records.times do |row|
  ServiceHasUser.create(user_id: Faker::Number.between(1, num_records),
                service_id: Faker::Number.between(1, num_records))
end

puts 'finished loading ServiceHasUsers data'

# Services creation
puts 'started loading Services data'
#Service.reset_pk_sequence

num_records.times do |row|
  Service.create(score: Faker::Number.between(1, 5),
                 post_id: Faker::Number.between(1, num_records))
end

puts 'finished loading Services data'

# Tags creation
puts 'started loading Tags data'
#Tag.reset_pk_sequence

num_records.times do |row|
  Tag.create(
      name: Faker::Appliance.brand)
end

puts 'finished loading Tags data'

# UserHasGroups creation
puts 'started loading UserHasGroups data'
#UserHasGroup.reset_pk_sequence

num_records.times do |row|
  UserHasGroup.create(user_id: Faker::Number.between(1, num_records),
                group_id: Faker::Number.between(1, num_records))
end

puts 'finished loading UserHasGroupss data'
# PostHasTag creation
puts 'started loading PostHasTag data'
#PostHasTag.reset_pk_sequence

num_records.times do |row|
  PostHasTag.create(post_id: Faker::Number.between(1, num_records),
                    tag_id: Faker::Number.between(1, num_records))
end

puts 'finished loading PostHasTag data'