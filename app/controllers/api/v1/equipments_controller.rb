module Api::V1
  class EquipmentsController < ApplicationController
    before_action :authenticate_user!

    def index
      equipments = current_user.equipments.order('created_at DESC')
      render json: equipments
    end

    def show
      equipment = Equipment.find(params[:id])
      render json: equipment
    end

    def create
      equipment = current_user.equipments.create(equipment_params)
      render json: equipment
    end

    def update
      equipment = Equipment.find(params[:id])
      equipment.update_attributes(equipment_params)
      render json: equipment
    end

    def destroy
      equipment = Equipment.find(params[:id])
      if equipment.destroy
        head :no_content, status: :ok
      else
        render json: equipment.errors, status: :unprocessable_entity
      end
    end

    private

    def equipment_params
      params.require(:equipment).permit(:name, :vendor_code, :serial_number, :size,
                                        :state, :price_per_hour, :price_per_day, :price_per_month,
                                        :rents_count, :total_rents_price, :group_id, :user_id)

    end
  end
end
