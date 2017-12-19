require 'rails_helper'

feature "Can show one single post" do
  scenario "when click on post, show single post" do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/#{post.id}')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
