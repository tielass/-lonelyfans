class MapController < ApplicationController
  def show
    @fans = Fan.all
    @markers = @fans.geocoded.map do |fan|
      {
        lat: fan.latitude,
        lng: fan.longitude,
        address: fan.address,
        info_window: render_to_string(partial: "info_window", locals: { fan: fan }),
        photo: helpers.asset_url("lonelyfans.png")
      }
    end
  end
end
