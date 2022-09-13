class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @order.pharmacy = @pharmacy
    @order.user = current_user
    @order.delivered = false # Could have done it when generating the model(default value)

    @medicine = Medicine.find(params[:order][:medicine_id])
    @medicine_stock = @pharmacy.stocks.where(medicine_id: @medicine)
    @stocks = @pharmacy.stocks

    # @available_quantities = @pharmacy.stocks.where(medicine_id: @medicine)
    @available_qty = @medicine_stock[0].quantity

    if @order.quantity.present?
      if @available_qty >= @order.quantity
        if Order.last.present? && Order.last.pharmacy == @pharmacy
          if @order.save
            @order.total_price = @order.quantity * @order.medicine.price
            @order.save
            # Reduce stock TODO
            # @order.medicine.stock.quantity -= @order.quantity
            redirect_to pharmacy_path(@pharmacy)
          else
            render "pharmacies/show", status: :unprocessable_entity
          end
        else
          redirect_to pharmacy_path(@pharmacy), notice: "You already ordered from #{Order.last.pharmacy.name}"
          # flash[:notice] = "Missing Fields"
        end
      else
        @order.errors.add(:quantity, "There's not enough stock")
        render "pharmacies/show", status: :unprocessable_entity
      end
    else
      @order.errors.add(:quantity, "Please add a quantity")
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to checkout_path
    # raise
  end

  private

  def order_params
    params.require(:order).permit(:pharmacy_id, :quantity, :delivery, :medicine_id)
  end
end
