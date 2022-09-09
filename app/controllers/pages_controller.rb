class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @medicines = Medicine.all
  end

  def checkout

  end
end
