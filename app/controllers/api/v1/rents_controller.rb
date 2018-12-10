class Api::V1::RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.rents.to_json(include: :customer)
  end

  def show
    rent = Rent.find(params[:id])
    render json: rent.to_json(include: [:equipments])
  end

  def create
    rent = current_user.rents.create(rent_params.merge(user_id: current_user.id))
    equipments = Equipment.where(id: params[:rent][:equipment_ids])
    equipments.update_all(status: rent_params[:status])

    render json:  rent.to_json(include: [:equipments])
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
    params.require(:rent).permit(:status, :start_date, :end_date, :subtotal_price, :total_price, 
                                 :paid, :discount, :customer_id, :duration, equipment_ids: [])
  end
end