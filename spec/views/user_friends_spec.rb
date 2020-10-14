require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Main flow', type: :system do
  let(:test_friend) { User.create(name: 'Friend Test', email: 'friend@example.com', password: 'password') }
  let(:test_user) { User.create(name: 'User Test', email: 'user@example.com', password: 'password') }
  describe 'New user' do
    it 'User sign-up is correct' do
      # Access Home Page
      visit('/')

      # Go to Sign Up page
      click_link('Sign up')

      # Sign up
      sleep 1
      fill_in('user[name]', with: 'Test')
      fill_in('user[email]', with: 'test@email.com')
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')
      sleep 1
      click_button('Sign up')

      # Logout
      sleep 1
      click_link('Sign out')
    end
  end
  describe 'Friend request' do
    it 'path is correct' do
      # Access Home Page
      visit('/')

      click_link('Sign up')

      # user Sign up
      sleep 1
      fill_in('user[name]', with: 'user')
      fill_in('user[email]', with: 'user@example.com')
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')

      sleep 1
      click_button('Sign up')

      # Logout
      sleep 1
      click_link('Sign out')

      # Login as the friend
      sleep 1
      click_link('Sign up')
      sleep 1

      fill_in('user[name]', with: 'Test')
      fill_in('user[email]', with: 'test@email.com')
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')
      sleep 1
      click_button('Sign up')
      sleep 1

      click_link('All users')

      # Request a new friend
      sleep 1
      click_link('Add as a Friend')

      # Logout friend
      sleep 1
      click_link('Sign out')

      sleep 1
      fill_in('user[email]', with: 'user@example.com')
      fill_in('user[password]', with: 'password')
      click_button('Log in')
      sleep 1

      # Check requests
      click_link('Friend Requests')
      sleep 1
      click_link('Accept Request')
      sleep 1

      # reject requests
      click_link('Your Friends')
      sleep 1
      click_link('Unfriend')
      sleep 1
    end
  end
  describe 'create post' do
    it 'path is correct' do
      test_user

      # Access Home Page
      visit('/')

      # Login as the user
      fill_in('user[email]', with: 'user@example.com')
      fill_in('user[password]', with: 'password')
      click_button('Log in')
      sleep 1

      # Create a post
      fill_in('post[content]', with: 'this is an example post')
      sleep 1
      click_button('Save')

      # Comment on the post
      fill_in('comment[content]', with: 'this is an example comment')
      sleep 1
      click_button('Comment')

      # Like a post
      click_link('Like!')
      sleep 1

      # Logout
      click_link('Sign out')
    end
  end
end
