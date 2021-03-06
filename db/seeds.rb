# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Luke Skywalker', email: 'admin@s.net', password: '123')
User.create!(name: 'Lucas Caminante', email: 'admin1@s.net', password: '123')

Post.create!(title: 'Title one Luke', body: 'Lorem ipsum  asdf one', user_id: 1)
Post.create!(title: 'Title two Luke', body: 'Lorem ipsum  asdf two', user_id: 1)
Post.create!(title: 'Title one Lucas', body: 'Lorem ipsum  asdf one', user_id: 2)
Post.create!(title: 'Title two Lucas', body: 'Lorem ipsum  asdf two', user_id: 2)
