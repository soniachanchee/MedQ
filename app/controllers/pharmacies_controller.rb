class PharmaciesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @query = params[:query]
    session[:passed_variable] = @query

    @pharmacies = []
    if params[:query].present?
      @medicines = Medicine.where("name ILIKE ?", "%#{params[:query]}%")
      if @medicines[0].present?
        @stocks = Stock.where("medicine_id = #{@medicines[0].id} AND quantity > 0")
        @stocks.each do |stock|
          @pharmacies << stock.pharmacy
        end
      end
    else
      @pharmacies = Pharmacy.all
    end

    @markers = @pharmacies.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        lng: pharmacy.longitude
      }
    end
    # raise

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pharmacies/list", locals: {medicines: @medicines}, formats: [:html] }
    end
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
    @order = Order.new

    @query = session[:passed_variable]
    @medicines = Medicine.where("name ILIKE ?", "%#{@query}%")
    @medicine = Medicine.find(@medicines[0].id)
    # raise
    @medicine_stock = @pharmacy.stocks.where(medicine_id: @medicine)

    # @stock_med = Stock.where(medicine_id: @medicine)
    # @stock_pharma = @stock_med.where(pharmacy_id: @pharmacy)

    if params[:query].present?
      @medicines = Medicine.where("name ILIKE ?", "%#{params[:query]}%")
      # raise
      if @medicines[0].present?
        @stocks = @pharmacy.stocks.where(medicine_id: @medicines[0].id)
      end
    else
      @stocks = @pharmacy.stocks
    end
  end
end
