class FansController < ApplicationController
  def index
    # @fans = Fan.all
    # if params[:nationality].present? || params[:category].present?
    if params[:nationality].present? || params[:category].present? || params[:query].present?
      @fans = Fan.search_by_something(params[:query]) if params[:query].present?
      @fans = Fan.where(nationality: params[:nationality]) if params[:nationality].present?
      @fans = Fan.where(category: params[:category]) if params[:category].present?
      @markers = @fans.geocoded.map do |fan|
            {
              lat: fan.latitude,
              lng: fan.longitude,
              info_window: render_to_string(partial: "info_window", locals: { fan: fan }),
              image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/931/931949.png")
            }
      end
    else
      @fans = Fan.all
      @markers = @fans.geocoded.map do |fan|
        {
          lat: fan.latitude,
          lng: fan.longitude,
          info_window: render_to_string(partial: "info_window", locals: { fan: fan }),
          image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/931/931949.png")
        }
      end
    end
    # if params[:query].present?
    #   @fans = Fan.search_by_something(params[:query])
    # else
    #   @fans = Fan.all
    # end
    #     if @fans.category.include?(params[:query])
    #   @fans = Fan.where(category: params[:query])
    # else
    #   @fans = Fan.all
    # end
    #   @markers = @fans.geocoded.map do |fan|
    #     {
    #       lat: fan.latitude,
    #       lng: fan.longitude,
    #       info_window: render_to_string(partial: "info_window", locals: { fan: fan }),
    #       image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/931/931949.png")
    #     }
    #   end
    # end
    # @markers = @fans.geocoded.map do |fan|
    #   {
    #     lat: fan.latitude,
    #     lng: fan.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { fan: fan }),
    #     image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/931/931949.png")
    #   }
    # end
  end

  # CRUD

  def show
    @fan = Fan.find(params[:id])
    @booking = Booking.new
  end

  def create
    @fan = Fan.new(fans_params)
    @fan.user = current_user

    if @fan.save
      redirect_to fan_path(@fan)
    else
      @bookings = current_user.bookings
      render 'pages/profile', status: :unprocessable_entity
    end
  end

  private

  def fans_params
    params.require(:fan).permit(:nationality,
                                :address,
                                :name,
                                :description,
                                :availability,
                                :category,
                                :price,
                                :user_id,
                                :photo)
  end
end
