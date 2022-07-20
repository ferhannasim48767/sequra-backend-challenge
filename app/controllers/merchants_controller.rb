class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[ get_orders ]
  before_action :set_week, only: %i[ get_orders ]

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def get_orders
    if @merchant.present?
      @orders = @merchant.orders.where(completed_at: @wkBegin..@wkEnd)
    else
      @orders = Order.where(completed_at: @wkBegin..@wkEnd)
    end
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      redirect_to merchants_path, notice: "Merchant was successfully created."
    end
  end

  private

  def set_merchant
    @merchant = Merchant.find_by(id: params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(:name, :email, :cif)
  end

  def set_week
    if params[:week].present?
      week    =  params[:week].to_i
      @wkBegin = Date.commercial(DateTime.now.year, week, 1)
      @wkEnd   = Date.commercial(DateTime.now.year, week, 7)
    end
  end
end
