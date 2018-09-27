module Api::V1
  class BranchesController < ApplicationController
    before_action :authenticate_user!

    def index
      puts "current user #{user.name}"
      branches = current_user.branches.order('created_at DESC')
      render json: branches
    end

    def show
      branch = Branch.find(params[:id])
      render json: branch
    end

    def create
      branch = current_user.branches.create(branch_params)
      render json: branch
    end

    def update
      branch = Branch.find(params[:id])
      branch.update_attributes(branch_params)
      render json: branch
    end

    def destroy
      branch = Branch.find(params[:id])
      if branch.destroy
        head :no_content, status: :ok
      else
        render json: branch.errors, status: :unprocessable_entity
      end
    end

    private

    def branch_params
      params.require(:branch).permit(:name)
    end
  end
end
