require 'rails_helper'

feature 'Can delete a post' do
  background do
    user = create(:user)
    post = create(:post, caption: 'Abs for days.')
    sign_in_with user

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Problem solved! Post deleted.')
    expect(page).to_not have_content('Abs for days.')
  end
end
