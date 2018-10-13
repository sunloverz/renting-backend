class Api::V1::RentsController < ApplicationController
  before_action :authenticate_user!
  STATUSES = {rented: 'rented', reserved: 'reserved', expired: 'expired'}


  def index
    render json: current_user.rents.to_json(include: :customer)
  end

  def show
    rent = Rent.find(params[:id])
    render json: rent
  end

  def create
    rent = current_user.rents.create(rent_params)
    params[:rent][:equipment_ids].each {|id| rent.line_items.build(equipment_id: id) }
    rent.save!

    equipments = Equipment.where(id: params[:rent][:equipment_ids])
    equipments.update_all(status: STATUSES[:rented])

    render json:  rent.to_json(include: [:line_items])
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
                                 :paid, :discount, :customer_id, :duration)
  end
end