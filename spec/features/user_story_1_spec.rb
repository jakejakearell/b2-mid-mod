require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do

  end

  describe "when I visit mechanics index page" do
    it "shows me all the mechanic info" do
      expect(page).to have_content("All Mechanics")

      expect(page).to have_content("#{@mechanic_1.name}")
      expect(page).to have_content("#{@mechanic_1.years_of_experience}")

      expect(page).to have_content("#{@mechanic_2.name}")
      expect(page).to have_content("#{@mechanic_2.years_of_experience}")


      expect(page).to have_content("Average years of experience #{Mechanic.average_years}")

    end

  end
end
