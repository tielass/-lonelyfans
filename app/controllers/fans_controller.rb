class FansController < ApplicationController
  def index
    if params[:query].present?
      @fans = Fan.search_by_something(params[:query])
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
      # if params[:user].present? || params[:query].present? || params[:size].present?
      #   @offers = policy_scope(Offer).global_search(params[:user]) if params[:user].present?

      #   if @offers.nil?
      #     @offers = policy_scope(Offer).global_search(params[:query]) if params[:query].present?
      #   elsif params[:query].present?
      #     @offers = @offers.global_search(params[:query])
      #   end

      #   if @offers.nil?
      #     @offers = policy_scope(Offer).global_search(params[:size]) if params[:size].present?
      #   else
      #     @offers = @offers.global_search(params[:size]) if params[:size].present?
      #   end
      # else
      #   @offers = policy_scope(Offer)
      # end
    end
  end

  # def index
  #   if params[:user].present? || params[:query].present? || params[:size].present?
  #     @offers = policy_scope(Offer).global_search(params[:user]) if params[:user].present?

  #     if @offers.nil?
  #       @offers = policy_scope(Offer).global_search(params[:query]) if params[:query].present?
  #     elsif params[:query].present?
  #       @offers = @offers.global_search(params[:query])
  #     end

  #     if @offers.nil?
  #       @offers = policy_scope(Offer).global_search(params[:size]) if params[:size].present?
  #     else
  #       @offers = @offers.global_search(params[:size]) if params[:size].present?
  #     end
  #   else
  #     @offers = policy_scope(Offer)
  #   end
  # end

  def loud
    @fans = Fan.where(category: "loud")
  end

  def violent
    @fans = Fan.where(category: "violent")
  end

  def supportive
    @fans = Fan.where(category: "supportive")
  end

  def serious
    @fans = Fan.where(category: "serious")
  end

  def settled
    @fans = Fan.where(category: "settled")
  end

  def good_behaviour
    @fans = Fan.where(category: "good behaviour")
  end

  def drunk
    @fans = Fan.where(category: "drunk")
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
                                :name,
                                :description,
                                :availability,
                                :category,
                                :price,
                                :user_id,
                                :photo)
  end
end
