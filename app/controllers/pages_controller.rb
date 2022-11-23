class PagesController < ApplicationController
  def home
  end

  def profile
    @fan = Fan.new(fan_params)
    # user_id = current_user[:id]
    @fan.user = current_user
    @bookings = Booking.where(user: current_user)
    @today = Date.today
  end

  private

  def fan_params
    params.permit(:nationality, :name, :description, :availability, :category, :price, :user_id, :image_url)
  end
end
