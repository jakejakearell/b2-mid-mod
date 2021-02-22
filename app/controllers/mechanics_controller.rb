class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def new
    @mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride_id])
    new_job = RideMechanic.new(ride: ride, mechanic: @mechanic)

    redirect_to "/mechanics/#{@mechanic.id}"
    
  end
end
