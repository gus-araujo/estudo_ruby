# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 500.times do
#     User.create(
#         name: Faker::Name.name,
#         age: Faker::Number.between(11,70),
#         gender: Faker::Gender.binary_type
#     )
# end

Category.create(
    slug: 'roupas'
)
Category.create(
    slug: 'acessorios'
)
Category.create(
    slug: 'sapatos'
)
Category.create(
    slug: 'outros'
)