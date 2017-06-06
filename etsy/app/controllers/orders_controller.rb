require 'stripe'

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:new, :create]

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @seller = @listing.user
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id
    @order.listing_id = @listing.id

    Stripe.api_key = Rails.application.secrets.stripe_secret_key
    begin
      Stripe::Charge.create(amount: (@listing.price * 100).floor,
                          currency: 'usd',
                            source: params[:stripe_token],
                       description: "Charge for #{@listing.description}")
      flash[:notice] = 'Thanks for your order!'
    rescue Stripe::CardError => error
      flash[:danger] = error.message
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def sales
    orders = Order.all
    @orders = orders.where(seller: current_user).order('created_at DESC')
    @unpaid = orders.where(seller: current_user, paid: false).order('created_at DESC')
    @unpaid_total = @unpaid.inject(0) { |running_total, order| order.listing.price + running_total }
    @total = @orders.inject(0) { |running_total, order| order.listing.price + running_total }
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order('created_at DESC')
    @total = @orders.inject(0) { |running_total, order| order.listing.price + running_total }
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state, :stripe_token)
    end
end
