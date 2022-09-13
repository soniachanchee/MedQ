class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @medicines = Medicine.all
  end

  def checkout
    # raise

    @order = Order.where(user: current_user).last
    @pharmacy = @order.pharmacy
    # raise
    # @chatroom = Chatroom.where(name: @pharmacy.name)
    # if @chatroom.nil?
      @chatroom = Chatroom.new(name: @pharmacy.name)
    # end
    # raise
    @prescription = Prescription.new(user_id: current_user)
  end

  # def create
  #   @prescription = Prescription.new(prescription_params)
  #   @prescription.save
  # end

  # private

  # def prescription_params
  #   params.require(:prescription).permit(:name, :user_id)
  # end
end
