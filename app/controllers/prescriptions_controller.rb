class PrescriptionsController < ApplicationController
  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user = current_user
    @prescription.save
    flash.alert = "Uploaded"
    redirect_to checkout_path
  end

  private

  def prescription_params
    params.require(:prescription).permit(:name, :user_id, :photo)
  end
end
