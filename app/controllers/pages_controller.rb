class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @medicines = Medicine.all
  end

  def checkout
    # raise
    # @chatroom = Chatroom.where(name: @pharmacy.name)
    # if @chatroom.nil?
      # @chatroom = Chatroom.new(name: @pharmacy.name)
    # end
  end
end
