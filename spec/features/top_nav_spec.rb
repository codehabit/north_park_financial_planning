require 'rails_helper'

RSpec.describe HomeController do
  it "can visit the Get Started page" do
    visit home_path
    click_on "get started"
    expect(current_path).to eq new_account_path
  end

  it "can visit the about us page" do
    visit home_path
    click_on "learn more about us"
    expect(current_path).to eq about_path
  end

  it "can get back to the home page" do
    visit home_path
    click_on "get started"
    expect(current_path).to eq new_account_path
    click_on "home"
    expect(current_path).to eq home_path
  end
end
