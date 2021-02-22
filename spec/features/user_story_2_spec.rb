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



      expect(page).to have_content("#{@mike.name}")
      expect(page).to have_content("#{@mike.years_of_experience}")

      within "#ride-1" do
        expect(page).to have_content("#{@small_world.name}")
      end

      within "#ride-2" do
        expect(page).to have_content("#{@fast_furious.name}")
      end

      expect(page).to have_no_content("#{@death_drop.name}")

    end

  end
end
