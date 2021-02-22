class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_and_most_thrilling
    where("open = ?", true).order(thrill_rating: :desc)
  end
end
