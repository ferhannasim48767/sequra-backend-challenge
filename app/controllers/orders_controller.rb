class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy calculate_fee mark_complete]

  def index
    @orders = Order.includes(:merchant, :shopper).all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: "Order was successfully created."
    else
      render :new
    end
  end

  def mark_complete
    if @order.completed_at.nil?
      @order.update(completed_at: DateTime.now)
    end
    redirect_to orders_path, notice: "Fee was successfully calculated."
  end

  def calculate_fee
    if @order.completed_at.present?
      CalculateFeeService.call(@order)
      redirect_to orders_path, notice: "Fee is calculated."
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order was successfully destroyed."
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:amount, :disburs_fee, :shopper_id, :merchant_id)
  end
end
