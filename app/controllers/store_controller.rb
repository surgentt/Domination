class StoreController < ApplicationController
  def index
  	@courses = Course.order(:title)
    @cart = current_cart
  end

  def show
  	@course = Course.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end
end
