class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @medicines = Medicine.all
  end

  def checkout
    @order = Order.where(user: current_user).last
    if @order.present?
      @pharmacy = @order.pharmacy

      # @chatroom = Chatroom.where(name: @pharmacy.name)
      # if @chatroom.nil?
        @chatroom = Chatroom.new(name: @pharmacy.name)
        @chatroom.save
      # end

      @prescription = Prescription.new(user_id: current_user)

      # @order = []
      @order = Order.last
      @orders = Order.where(user_id: current_user)
      # @order = @orders[0]

      # @order = Order.where("user_id = #{current_user} AND pharmacy_id =")
    end
  end

  def view_profile
    @user = current_user
    @pharmacy = Pharmacy.new
    @chatroom = Chatroom.where(name: Pharmacy.where(user_id: current_user.id).name)
  end
end
