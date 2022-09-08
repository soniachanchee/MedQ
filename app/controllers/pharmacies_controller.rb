class PharmaciesController < ApplicationController
  def index
    @query = params[:query]
    session[:passed_variable] = @query

    if params[:query].present?
      @medicines = Medicine.where(name: params[:query])
      if @medicines[0].present?
        @stocks = Stock.where(medicine_id: @medicines[0].id)
      end
    end

    @pharmacies = Pharmacy.where(name: params[:query])
    @markers = @pharmacies.geocoded.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        lng: pharmacy.longitude
      }
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pharmacies/list", locals: {medicines: @medicines}, formats: [:html] }
    end
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
    @query = session[:passed_variable]
    @medicine = Medicine.where(name: @query)
    @stock_med = Stock.where(medicine_id: @medicine)
    @stock_pharma = @stock_med.where(pharmacy_id: @pharmacy)
    # @stocks = Stock.where(pharmacy_id: @pharmacy.id)
    @order = Order.new

    if params[:query].present?
      @medicines = Medicine.where(name: params[:query])
      if @medicines[0].present?
        @stocks = Stock.where(medicine_id: @medicines[0].id)
      end
    else
      @stocks = Stock.where(pharmacy_id: @pharmacy.id)
    end
  end
end
