class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    puts "e"
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
      puts "a"
      if @available_qty >= @order.quantity
        puts "b"
        last_order = Order.last
        if last_order.present?
          puts "1"
          if last_order.pharmacy == @pharmacy
            # raise
            puts "c"
            save_order
            puts "g"
          else
            puts "h"
            redirect_to pharmacy_path(@pharmacy), notice: "You already ordered from #{last_order.pharmacy.name}. You must order from the same store."
          end
        else
          save_order
        end
        puts "2"
      else
        puts "3"
        @order.errors.add(:quantity, "There's not enough stock")
        render "pharmacies/show", status: :unprocessable_entity
      end
      puts "4"
    else
      puts "5"
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

  def save_order
    if @order.save
      puts "d"
      @order.total_price = @order.quantity * @order.medicine.price
      @order.save
      # Reduce stock TODO
      test = @medicine_stock[0].quantity - @order.quantity
      @medicine_stock[0].quantity = test
      # raise
      # @order.medicine.stock.quantity -= @order.quantity
      redirect_to pharmacy_path(@pharmacy)
    else
      puts "f"
      render "pharmacies/show", status: :unprocessable_entity
    end
  end

  def order_params
    params.require(:order).permit(:pharmacy_id, :quantity, :delivery, :medicine_id)
  end
end
