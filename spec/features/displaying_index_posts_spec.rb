require 'rails_helper'

feature 'Index displays a list of posts' do
  background do
    user = create(:user)
    sign_in_with user
  end

  scenario 'the index displays correct created post information' do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is post two")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is post two")
    expect(page).to have_css("img[src*='coffee']")
  end
end
