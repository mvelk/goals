
# spec/features/auth_spec.rb
require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before(:each) do
    visit new_user_path
  end
  scenario "has a new user page" do
    expect(page).to have_content "Sign Up"
  end
  feature "signing up a user" do
    scenario "shows username on the goals page after signup" do
      fill_in "username", with: "Gabe"
      fill_in "password", with: "1234567890"
      click_on "Sign Up"
      expect(page).to have_content("Gabe")
    end
  end

end

feature "logging in" do
  before(:each) do
    gabe = User.new(username: "Gabe", password: "pocketbomb")
    gabe.save
    visit new_session_path
  end
  scenario "shows username on the homepage after login" do
    fill_in "username", with: "Gabe"
    fill_in "password", with: "pocketbomb"
    click_on "Sign In"
    expect(page).to have_content("Gabe")
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit goals_url
    expect(page).to have_content("Sign In")
  end
  scenario "doesn't show username on the homepage after logout" do
    gabe = User.create(username: "Gabe", password: "pocketbomb")
    visit new_session_url
    fill_in "username", with: "Gabe"
    fill_in "password", with: "pocketbomb"
    click_on "Sign In"
    save_and_open_page
    click_on "Log Out"
    expect(page).to_not have_content("Gabe")
  end
end
