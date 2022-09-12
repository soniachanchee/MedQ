class PrescriptionsController < ApplicationController
  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.save
  end

  private

  def prescription_params
    params.require(:prescription).permit(:name, :user_id)
  end
end
