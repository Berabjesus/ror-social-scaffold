require 'rails_helper'

RSpec.describe 'signup page', type: :feature do
  scenario 'signup page' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'test2'
    fill_in 'user_email', with: 'test2@test.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully')
  end
end
