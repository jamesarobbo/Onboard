class OrdersController < ApplicationController

#   make sure users are logged in before being able to Orders

before_action :make_sure_logged_in

def new
# booking form
  # find the room
  @room = Room.find(params[:room_id])
  # and because the room has many Orders

  @order = @room.orders.new

  @order.user = current_user

end

def create
# actually create the record in the db

  @room = Room.find(params[:room_id])

  @order = @room.orders.new(order_params)

  @order.user = current_user

  if @order.save!

      # want to actually charge the card using stripe
      Stripe::Charge.create(
          amount: @room.price_in_pence,
          currency: "gbp",
          card: @order.stripe_token,
          description: "Order number #{@order.id}" # this last bit starting with the # is a way to put a variable into a string
      )

      flash[:success] = "Your room has been booked"
      redirect_to room_path(@room)
  else
      render "new"
  end

end


def order_params
  params.require(:order).permit(:stripe_token)

end

end
