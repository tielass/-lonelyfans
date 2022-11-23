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
    @fan.user = current_user

    if @fan.save
      redirect_to profile_path
    else
      render 'pages/profile', status: :unprocessable_entity
    end
  end

  private

  def fans_params
    params.require(:fan).permit(:nationality, :name, :description, :availability, :category, :price, :user_id, :image_url)
  end
end
