require 'rails_helper'

RSpec.describe AccountsController do
  specify "that an account can be created" do
    visit new_account_path
    fill_in "Full Name", with: "John Doe"
    fill_in "Email", with: "jon.doe@example.com"
    click_on "Get Started"
    expect(page).to have_content("John Doe")
    expect(page).to have_content("jon.doe@example.com")
  end
end
