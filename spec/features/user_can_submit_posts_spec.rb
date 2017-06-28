require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
  scenario "Can see the date and time on posts" do
    visit "/posts"
    click_link "Add New post"
    fill_in "Message", with: "New Post"
    date = DateTime.now
    click_button "Submit"
    expect(page).to have_content(date.strftime("%t"))
  end
  scenario "See the newest posts first" do
    visit "/posts"
    click_link "Add New post"
    fill_in "Message", with: "Old Post"
    click_button "Submit"
    click_link "Add New post"
    fill_in "Message", with: "Newest Post"
    click_button "Submit"
    expect("Newest Post").to appear_before("Old Post")
  end
  scenario "See the comments on the post" do
    visit "/posts"
    click_link "Add New post"
    fill_in "Message", with: "Post"
    click_button "Submit"
    click_link "View"
    click_link "Add Comment"
    fill_in "Comment", with: "New Comment"
    click_button "Submit"
    expect(page).to have_content("New Comment")
  end
  scenario "See the newest comments first" do
    visit "/posts"
    click_link "Add New post"
    fill_in "Message", with: "Post"
    click_button "Submit"
    click_link "View"
    click_link "Add Comment"
    fill_in "Comment", with: "Old Comment"
    click_button "Submit"
    click_link "View"
    click_link "Add Comment"
    fill_in "Comment", with: "New Comment"
    click_button "Submit"
    expect("New Comment").to appear_before("Old Comment")
  end
end
