require 'rails_helper'

RSpec.describe 'Users index view', type: :feature do
  before :all do
    @Tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @Lilly = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @Tom.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @Tom.id)
    @post3 = Post.create(title: 'post3', text: 'text3', author_id: @Lilly.id)
  end

  it 'displays usernames' do
    visit user_path
    expect(page).to have_content('Tom')
    expect(page).to have_content('Lilly')
  end

  it 'has the profile picture for each user' do
    visit user_path
    expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/F_-0BxGuVvo')]")
  end

  it 'displays the number of posts for each user' do
    visit user_path
    expect(page).to have_content('Number of posts: 2')
    expect(page).to have_content('Number of posts: 1')
  end

  it 'redirects to user show page' do
    visit user_path
    first(:link, 'Tom').click
    expect(page).to have_content('Teacher from Mexico.')
  end
end