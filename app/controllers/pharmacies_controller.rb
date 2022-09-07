class PharmaciesController < ApplicationController
  def index
    @query = params[:query]
    session[:passed_variable] = @query
    if params[:query].present?
      @medicines = Medicine.where(name: params[:query])
      # @medicines.stocks
      # raise
      @pharmacies = Pharmacy.all

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
    @query = session[:passed_variable]
    # @test = @query
    # raise
    @pharmacy = Pharmacy.find(params[:id])
    @stocks = Stock.where(pharmacy_id: @pharmacy.id)
    @medicine = Medicine.where(name: @query)
    # @medicines = Medicine.where()
  end
end

# def first
#   @first_value = params[:f_name]
#   session[:passed_variable] = @first_value
# end

# def second
#   @first_value = session[:passed_variable]
#   @get_value = @first_value
