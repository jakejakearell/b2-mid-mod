require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @mike = Mechanic.create!(name: "mike", years_of_experience: 10)
    @fred = Mechanic.create!(name: "fred", years_of_experience: 2)
    @doug = Mechanic.create!(name: "doug", years_of_experience: 12)

    @fast_furious = Ride.create!(name: "fast and furious", thrill_rating: 10, open: false)
    @small_world = Ride.create!(name: "small world", thrill_rating: 10, open: false)
    @death_drop = Ride.create!(name: "death drop", thrill_rating: 10, open: false)

    RideMechanic.create!(ride: @fast_furious, mechanic: @mike)
    RideMechanic.create!(ride: @small_world, mechanic: @fred)
    RideMechanic.create!(ride: @death_drop, mechanic: @doug)

  end

  describe "when I visit mechanics index page" do
    it "shows me all the mechanic info" do

      visit '/mechanics'

      expect(page).to have_content("All Mechanics")

      expect(page).to have_content("#{@fred.name}")
      expect(page).to have_content("#{@fred.years_of_experience}")

      expect(page).to have_content("#{@doug.name}")
      expect(page).to have_content("#{@doug.years_of_experience}")


      expect(page).to have_content("Average years of experience: 8")

    end

  end
end
