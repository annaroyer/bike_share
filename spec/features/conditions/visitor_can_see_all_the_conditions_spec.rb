require "rails_helper"

describe "As a visitor" do
  describe "When I visit the conditions index" do
    it "displays all the information for all the conditions" do
      c1 = create(:condition)
      c2 = create(:condition)

      visit conditions_path

      expect(page).to have_content(c1.date)
      expect(page).to have_content(c1.max_temperature)
      expect(page).to have_content(c1.mean_temperature)
      expect(page).to have_content(c1.min_temperature)
      expect(page).to have_content(c1.mean_humidity)
      expect(page).to have_content(c1.mean_visibility)
      expect(page).to have_content(c1.mean_wind_speed)
      expect(page).to have_content(c1.mean_precipitation)
      expect(page).to have_content(c1.zip_code)

      expect(page).to have_content(c2.date)
      expect(page).to have_content(c2.max_temperature)
      expect(page).to have_content(c2.mean_temperature)
      expect(page).to have_content(c2.min_temperature)
      expect(page).to have_content(c2.mean_humidity)
      expect(page).to have_content(c2.mean_visibility)
      expect(page).to have_content(c2.mean_wind_speed)
      expect(page).to have_content(c2.mean_precipitation)
      expect(page).to have_content(c2.zip_code)
    end
  end
end