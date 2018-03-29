require 'rails_helper'

RSpec.describe Admin::ContentsController do
  it "creates a new content" do
    name = "About body"
    body = "This is the content I want to use for the about body"
    visit new_admin_content_path
    fill_in "Name", with: name
    fill_in "Body", with: body
    click_on "Done"
    expect(page).to have_content(name)
    expect(page).to have_content(body)
  end
end
