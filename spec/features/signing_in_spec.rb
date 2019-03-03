require "rails_helper"

RSpec.feature "users can sign in" do
  let(:user) { FactoryBot.create(:user) }

  scenario "valid credentials" do
    visit "/"
    click_link "sign in"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: "password"
    click_button "Log in"

    # expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "#{user.email}"
  end
end
