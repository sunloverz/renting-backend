class Api::V1::RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.rents
  end

  def show
    rent = Rent.find(params[:id])
  end

  def create
    rent = current_user.rents.create(rent_params)
    render json: rent
  end

  def destroy
    rent = Rent.find(params[:id])

    if rent.destroy
      head :no_content, status: :ok
    else
      render json: rent.errors, status: :unprocessable_entity
    end
  end


  private

  def rent_params
    params.require(:rent).permit(:status, :rent_type, :start_date, :end_date, :price,
                                 :paid, :discount, :customer_id)
  end
end