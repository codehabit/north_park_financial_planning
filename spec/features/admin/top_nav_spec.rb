require 'rails_helper'

RSpec.describe HomeController do
  context "when admin is logged in" do
    let!(:email) { "non@non.com" }
    let!(:password) { "password123" }
    let!(:admin) { Admin.create(email: email, password: password) }

    before :each do
      visit new_admin_session_path
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_on "Log in"
    end

    it "shows sign out" do
      expect(page).to have_link "sign out"
    end

    it "shows manage contents link" do
      expect(page).to have_link "manage content"
    end
  end
end
