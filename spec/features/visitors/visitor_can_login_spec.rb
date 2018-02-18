require "rails_helper"

describe "As a visitor" do
  describe "when I visit the root" do
    it "he or she can login" do
      user = create(:user)

      visit '/'

      click_on "Log In"

      expect(current_path).to eq(login_path)

      fill_in "email", with: user.email
      fill_in "password", with: user.password

      click_on "Login"

      expect(page).to have_content("Logged in as #{user.name}")
      expect(page).to have_content("Email: #{user.email}")
      expect(page).to have_content("Account Created: #{user.created_at}")
    end
  end
end
