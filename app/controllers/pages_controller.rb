class PagesController < ApplicationController
  def home
  end

  def profile
    @fan = Fan.new(fan_params)
    # user_id = current_user[:id]
    @fan.user = current_user
    @today = Date.today
    @future_bookings = Booking.where("end_time >= ?", @today).where(user: current_user).order(start_time: :asc)
    @past_bookings = Booking.where("end_time < ?", @today).where(user: current_user).order(start_time: :asc)
  end

  private

  def fan_params
    params.permit(:nationality, :name, :description, :availability, :category, :price, :user_id, :photo)
  end
end
