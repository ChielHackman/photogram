require 'rails_helper'

feature 'Deleting comments' do
  background do
    user = create(:user)
    user_two = create(:user, id: 2, user_name: 'Harry', email: 'harry@photogram.com')
    @post = create(:post)
    @comment = create(:comment, user_id: user_two.id, post_id: @post.id)
    @comment_two = create(:comment, user_id: user.id, id: 2, post_id: @post.id, content: 'You guys are too kind xo')
    sign_in_with user_two
  end

  scenario 'user can delete their own comments' do
    visit '/'
    expect(page).to have_content('Nice post!')
    click_link "delete-#{@comment.id}"
    expect(page).to_not have_content('Nice post!')
  end

  scenario 'user cannot delete someone else his comment' do
    visit '/'
    expect(page).to have_content('You guys are too kind xo')
    expect(page).to_not have_css("#delete-#{@comment_two.id}")
  end

  scenario 'user cannot delete someone else his comment via urls' do
    visit '/'
    expect(page).to have_content('You guys are too kind xo')
    page.driver.submit :delete, "posts/#{@post.id}/comments/2", {}
    expect(page).to have_content("That doesn't belong to you!")
    expect(page).to have_content('You guys are too kind xo')
  end
end
