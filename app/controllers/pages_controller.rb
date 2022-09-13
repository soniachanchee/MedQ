class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @medicines = Medicine.all
  end

  def checkout
    # @chatroom = Chatroom.where(name: @pharmacy.name)
    # if @chatroom.nil?
    #   @chatroom = Chatroom.new(name: @pharmacy.name)
    # end

    @prescription = Prescription.new(user_id: current_user)

    # @order = []
    @orders = Order.where(user_id: current_user)
    # @order = @orders[0]

    # @order = Order.where("user_id = #{current_user} AND pharmacy_id =")
  end

  # def create
  #   @prescription = Prescription.new(prescription_params)
  #   @prescription.save
  # end

  # private

  # def prescription_params
  #   params.require(:prescription).permit(:user_id, :photo)
  # end
end
