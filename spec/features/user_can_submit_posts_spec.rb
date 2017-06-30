require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before :each do
    visit "/posts"
    click_link "Sign up"
    fill_in "Email", with: "sam@msn.com"
    fill_in "Password", with: "bob"
    click_button "Sign up"
  end

  scenario "Can submit posts and view them" do
    click_link "Add New post"
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

  scenario "Can see users email on the previous users post" do
    visit "/posts"
    click_link "Add New post"
    fill_in "Message", with: "Posts one"
    click_button "Submit"
    click_button "Sign out"
    click_link "Sign up"
    fill_in "Email", with: "sammy@yahoo.com"
    fill_in "Password", with: "bobby"
    click_button "Sign up"
    click_link "Add New post"
    fill_in "Message", with: "Posts two"
    click_button "Submit"
    expect(page).to have_content("sam@msn.com")
  end

  scenario "Can see the user email on posts" do
    visit "/posts"
    click_link "Add New post"
    fill_in "Message", with: "New Post"
    click_button "Submit"
    expect(page).to have_content("sam@msn.com")
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
  scenario "Posts can have more than one line" do
    visit "/posts"
    click_link "Add New post"
    fill_in "Message", with: "Post\n Hello\n"
    click_button "Submit"
    expect(page).to have_content("Post\n Hello\n")
  end
end
