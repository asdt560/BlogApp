# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create!([{
   name: 'Default2', 
   photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
   bio: 'Normal user.', 
   role: 'default', 
   encrypted_password: '$2a$12$192AtELpNZ0aZCfnSxs35umQYmbSn52FK8ML/vY.iZvDW4FvkvHn2', 
   password: '6letters',
   created_at: Time.now,
   updated_at: Time.now,
   email: 'mail2@example.com'
  }, 
  {
   name: 'Admin2', 
   photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
   bio: 'Site Administrator.', 
   role: 'admin', 
   password: '6letters',
   created_at: Time.now,
   updated_at: Time.now,
   encrypted_password: '$2a$12$192AtELpNZ0aZCfnSxs35umQYmbSn52FK8ML/vY.iZvDW4FvkvHn2', 
   email: 'admin2@example.com'
  }])
post = Post.create(title: 'post by default', text: 'text by default', author_id: users.first.id)
Comment.create(text: 'comment1', author_id: users.first.id, post_id: post.id)
User.create!(
  name: 'Admin2', 
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
  bio: 'Site Administrator.', 
  role: 'admin', 
  password: '6letters',
  created_at: Time.now,
  updated_at: Time.now,
  encrypted_password: '$2a$12$192AtELpNZ0aZCfnSxs35umQYmbSn52FK8ML/vY.iZvDW4FvkvHn2', 
  email: 'admin2@example.com'
 )