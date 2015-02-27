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
      redirect_to user_path(@user), notice: "Your trip was successfully saved."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @trip = @user.trips.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @trip = @user.trips.find(params[:id])
    if @trip.update(trip_params)
      redirect_to user_path(@user), notice: "Your trip was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @trip = @user.trips.find(params[:id])
    @trip.destroy
    redirect_to user_path(@user), notice: "Your trip was successfully deleted."
  end





private

  def trip_params
    params.require(:trip).permit(:location, :date, :cost)
  end

end
