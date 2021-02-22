require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @mike = Mechanic.create!(name: "mike", years_of_experience: 10)

    @fast_furious = Ride.create!(name: "fast and furious", thrill_rating: 1, open: true)
    @small_world = Ride.create!(name: "small world", thrill_rating: 10, open: true)
    @death_drop = Ride.create!(name: "death drop", thrill_rating: 10, open: false)
    @crazy_frog = Ride.create!(name: "crazy frog", thrill_rating: 100, open: true)

    RideMechanic.create!(ride: @fast_furious, mechanic: @mike)
    RideMechanic.create!(ride: @small_world, mechanic: @mike)
    RideMechanic.create!(ride: @death_drop, mechanic: @mike)

  end

  describe "when I visit mechanics show page" do
    it "shows a form to add a ride to their workload" do

      visit "/mechanics/#{@mike.id}"

      expect(page).to have_no_content("#{@crazy_frog.name}")

      fill_in "ride_id", with: "#{@crazy_frog.id}"

      click_button 'Submit'

      expect(current_path).to eq "/mechanics/#{@mike.id}"

      within "#ride-1" do
        expect(page).to have_content("#{@crazy_frog.name}")
      end
    end
  end
end
