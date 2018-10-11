module Api::V1
  class CustomersController < ApplicationController
    before_action :authenticate_user!

    def index
      @customers = current_user.customers.order('created_at DESC')
      render json: @customers
    end

    def show
      @customer = Customer.find(params[:id])
      render json: @customer
    end

    def create
      @customer = current_user.customers.create(customer_params)
      render json: @customer
    end

    def update
      @customer = Customer.find(params[:id])
      @customer.update_attributes(customer_params)
      render json: @customer
    end

    def destroy
      @customer = Customer.find(params[:id])
      if @customer.destroy
        head :no_content, status: :ok
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    private

    def customer_params
      params.require(:customer).permit(:name, :phone, :email, :discount, :note, :birthdate, :address,
                                       :passport_id, :issued_by, :issue_date, :in_blacklist)
    end
  end
end
