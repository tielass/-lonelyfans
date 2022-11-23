class FansController < ApplicationController
  def index
    @fans = Fan.all
  end

  def show
    @fan = Fan.find(params[:id])
    @booking = Booking.new
  end

  def create
    @fan = Fan.new(fans_params)
    @fan.save
  end

  private

  def fans_params
    params.require(:fan).permit(:nationality, :name, :description, :availability, :category, :price, :user_id)
  end
end
