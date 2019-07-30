# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Poll.destroy_all
# Question.destroy_all
# AnswerChoice.destroy_all
# Response.destroy_all

User.create([{username: 'Adam'},{username: 'Bob'},{username: 'Claude'},{username: 'David'},{username: 'Eric'}])
Poll.create([{user_id: 1, title: 'Poll 1'}, {user_id: 4, title: 'Poll 2'}, {user_id: 5, title: 'Poll 3'}])
Question.create([{poll_id: 1, text: 'Dogs or Cats?'}, {poll_id: 2, text: 'Apple or Windows?'}, {poll_id: 3, text: 'Blue or Red?'}])
AnswerChoice.create([{question_id: 1, text: 'Dogs'}, {question_id: 1, text: 'Cats'},{question_id: 2, text: 'Apple'}, {question_id: 2, text: 'Windows'},{question_id: 3, text: 'Blue'}, {question_id: 3, text: 'Red'}])
Response.create([{user_id: 2, question_id: 2, answer_choice_id: 3}, {user_id: 1, question_id: 2, answer_choice_id: 4}, {user_id: 3, question_id: 3, answer_choice_id: 6}])
