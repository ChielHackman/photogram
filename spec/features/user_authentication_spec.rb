require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'can log in' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'johndoe@gmail.com'
    fill_in 'Password', with: '123456789'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'can logout' do
    visit '/'

    click_link 'Login'
    fill_in 'Email', with: 'johndoe@gmail.com'
    fill_in 'Password', with: '123456789'
    click_button 'Log in'
    click_link 'Logout'

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot see posts on index when not logged in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot create new posts when not logged in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
