class PharmaciesController < ApplicationController
  def index
    if params[:query].present?
      @medicines = Medicine.where(name: params[:query])
      # @medicines.stocks
      # raise
      @pharmacies = Pharmacy.all

      @stocks = Stock.where(medicine_id: @medicines[0].id)
      # raise
    end
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
  end
end
