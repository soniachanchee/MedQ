class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @order.pharmacy = @pharmacy
    @order.user = current_user
    @order.delivered = false
    @medicine = Medicine.find(params[:order][:medicine_id])
    @available_quantities = @pharmacy.stocks.where(medicine_id: @medicine)
    @a = 0
    @available_quantities.each do |available_qty|
      @a = available_qty.quantity
    end
    if @a > @order.quantity
      if @order.save
        @order.total_price = @order.quantity * @order.medicine.price
        # Reduce stock TODO
        @order.save
        # @order.medicine.stock.quantity -= @order.quantity
        redirect_to pharmacy_path(@pharmacy)
      else
        render "pharmacies/show", status: :unprocessable_entity
      end
    else
      @order.errors.add(:quantity, "error")
      render "pharmacies/show", status: :unprocessable_entity
    end

    # raise
    # if @order.save
    #   @order.total_price = @order.quantity * @order.medicine.price
    #   # Reduce stock TODO
    #   @order.save
    #   # @order.medicine.stock.quantity -= @order.quantity
    #   redirect_to pharmacy_path(@pharmacy)
    # else
    #   flash[:alert] = "Something went wrong"
    #   render "pharmacies/show", status: :unprocessable_entity
    # end
    # raise
  end

  private

  def order_params
    params.require(:order).permit(:pharmacy_id, :quantity, :delivery, :medicine_id)
  end
end
