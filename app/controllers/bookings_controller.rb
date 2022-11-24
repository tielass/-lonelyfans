class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @fan = Fan.find(params[:fan_id])
    @booking = Booking.find(params[:id])
  end

  def new
    @fan = Fan.find(params[:fan_id])
    @booking = Booking.new
  end

  def create
    @fan = Fan.find(params[:fan_id])
    @booking = Booking.new(booking_params)
    @booking.fan = @fan
    @booking.user = current_user
    if @booking.save
      redirect_to fan_booking_path(@fan, @booking)
    else
      render :new, status: unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to fan_path(@booking.fan), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status, :user_id, :fan_id)
  end
end
