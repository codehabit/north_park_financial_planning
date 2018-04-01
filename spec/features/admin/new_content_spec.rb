require 'rails_helper'

RSpec.describe Admin::ContentsController do
  before :each do
    login_as_admin
  end

  let(:name) { "About body" }
  let(:body) { "This is the content I want to use for the about body" }

  before :each do
    visit new_admin_content_path
    fill_in "Name", with: name
    fill_in "Body", with: body
    click_on "done"
  end

  it "redirects to the index page" do
    expect(current_path).to eq admin_contents_path
  end

  it "creates a new content" do
    expect(page).to have_content(name)
  end
end
