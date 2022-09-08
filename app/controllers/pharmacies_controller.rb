class PharmaciesController < ApplicationController
  def index

    if params[:query].present?
      @medicines = Medicine.where(name: params[:query])
      # @medicines.stocks
      # raise
      @pharmacies = Pharmacy.where(name: params[:query])
      @markers = @pharmacies.geocoded.map do |pharmacy|
        {
          lat: pharmacy.latitude,
          lng: pharmacy.longitude
        }
      end
      if @medicines[0].present?
        @stocks = Stock.where(medicine_id: @medicines[0].id)
      end
      # raise
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pharmacies/list", locals: {medicines: @medicines}, formats: [:html] }
    end
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
  end
end
