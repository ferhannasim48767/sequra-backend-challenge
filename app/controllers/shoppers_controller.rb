class ShoppersController < ApplicationController

  def index
    @shoppers = Shopper.all
  end

  def new
    @shopper = Shopper.new
  end

  def create
    @shopper = Shopper.new(shopper_params)
    if @shopper.save
      redirect_to shoppers_path, notice: "Shopper was successfully created."
    end
  end

  private

  def shopper_params
    params.require(:shopper).permit(:name, :email, :nif)
  end
end
