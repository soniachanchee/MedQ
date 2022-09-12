class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @medicines = Medicine.all
  end

  def checkout
    @pharmacy = session[:passed_variable]
    # raise
    @chatroom = Chatroom.new()
  end
end
