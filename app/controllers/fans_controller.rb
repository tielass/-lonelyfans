class FansController < ApplicationController
  def index
    @fans = Fan.all
    @markers = @fans.geocoded.map do |fan|
      {
        lat: fan.latitude,
        lng: fan.longitude,
        info_window: render_to_string(partial: "info_window", locals: { fan: fan }),
        image_url: helpers.asset_url("lonelyfans.png")
      }
    end
  end

  def show
    @fan = Fan.find(params[:id])
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
