class Order < ActiveRecord::Base

  #relationships that the orders have

  belongs_to :room

  belongs_to :user




end
