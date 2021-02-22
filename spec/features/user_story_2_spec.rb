require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @mike = Mechanic.create!(name: "mike", years_of_experience: 10)

    @fast_furious = Ride.create!(name: "fast and furious", thrill_rating: 1, open: true)
    @small_world = Ride.create!(name: "small world", thrill_rating: 10, open: true)
    @death_drop = Ride.create!(name: "death drop", thrill_rating: 10, open: false)


    RideMechanic.create!(ride: @fast_furious, mechanic: @mike)
    RideMechanic.create!(ride: @small_world, mechanic: @mike)
    RideMechanic.create!(ride: @death_drop, mechanic: @mike)

  end

  describe "when I visit mechanics show page" do
    it "shows me all the mechanic info" do

      visit "/mechanics/#{@mike.id}"

      expect(page).to have_content("All Mechanics")

      expect(page).to have_content("#{@fred.name}")
      expect(page).to have_content("#{@fred.years_of_experience}")

      expect(page).to have_content("#{@doug.name}")
      expect(page).to have_content("#{@doug.years_of_experience}")


      expect(page).to have_content("Average years of experience: 8")

    end

  end
end
