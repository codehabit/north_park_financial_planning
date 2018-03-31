require 'rails_helper'

RSpec.describe Admin::ContentsController do
  context "when not logged in as admin" do
    it "redirects to home" do
      visit admin_contents_path
      expect(current_path).to eq home_path
    end
  end

  context "when logged in as admin" do
    let!(:email) { "non@non.com" }
    let!(:password) { "password123" }
    let!(:admin) { Admin.create(email: email, password: password) }

    before :each do
      visit new_admin_session_path
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_on "Log in"
    end

    it "shows the contents index" do
      visit admin_contents_path
      expect(current_path).to eq admin_contents_path
    end

    context "when there is content" do
      let!(:name) { "For the home page" }
      let!(:body) { "Home page body content" }
      let!(:content) { Content.create(name: name, body: body) }

      it "shows one piece of content" do
        visit admin_contents_path
        expect(page).to have_content name
      end
    end

    context "if there is no content" do
      it "shows a call to action" do
        visit admin_contents_path
        expect(page).to have_content "There is no content yet"
        expect(page).to have_link "create new content"
      end
    end
  end
end
