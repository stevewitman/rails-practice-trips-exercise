class TripsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @trips = @user.trips.all
  end

  def new
    @user = User.find(params[:user_id])
    @trip = @user.trips.new
  end

  def create
    @user = User.find(params[:user_id])
    @trip = @user.trips.new(trip_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

private

  def trip_params
    params.require(:trip).permit(:location, :date, :cost)
  end

end
