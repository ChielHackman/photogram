require 'rails_helper'

feature 'Create a new comment' do
  scenario 'creates a new comment' do
    user = create(:user)
    post = create(:post, user_id: user.id)

    sign_in_with user
    visit '/'

    fill_in 'Add a comment...', with: ';P'
    click_button 'Submit'
    expect(page).to have_css("div.comments#comments_#{post.id}", text: ';P')
  end
end
