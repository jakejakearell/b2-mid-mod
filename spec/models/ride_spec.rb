require 'rails_helper'

RSpec.describe Ride, type: :model do
  before(:each) do
    @mike = Mechanic.create!(name: "mike", years_of_experience: 10)
    @fred = Mechanic.create!(name: "fred", years_of_experience: 2)
    @doug = Mechanic.create!(name: "doug", years_of_experience: 12)

    @fast_furious = Ride.create!(name: "fast and furious", thrill_rating: 10, open: false)
    @small_world = Ride.create!(name: "small world", thrill_rating: 10, open: true)
    @death_drop = Ride.create!(name: "death drop", thrill_rating: 1, open: true)

    RideMechanic.create!(ride: @fast_furious, mechanic: @mike)
    RideMechanic.create!(ride: @small_world, mechanic: @fred)
    RideMechanic.create!(ride: @death_drop, mechanic: @doug)
  end

  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'class methods' do
    it "#open_and_most_thrilling" do
      expect(Ride.open_and_most_thrilling.count).to eq(2)

      expect(Ride.open_and_most_thrilling[0]).to eq(@small_world)

    end
  end
end
