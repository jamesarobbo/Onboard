class OrderMailer < ActionMailer::Base
  default from: "james@onboard.com"

# can call the method anything we want
# the (order) is us sending through the order to the emails
    def new_order(order)
        # let's make the order available in the view
        @order = order
        @room = @order.room
        @user = @room.user

        mail to: @user.email, subject: "You have a new order"

    end


end
