require 'rails_helper'

RSpec.describe Admin::ContentsController do
  let!(:content) { Content.create(name: "blah", body: "hi there") }
  before :each do
    login_as_admin
    visit admin_contents_path
    click_on "Edit"
  end

  it "links to the edit page" do
    expect(current_path).to eq edit_admin_content_path(content)
  end

  it "can update an existing content" do
    edited_body = "Something different"
    fill_in "Body", with: edited_body
    click_on "done"
    visit admin_content_path(content)
    expect(page).to have_content edited_body
  end
end
