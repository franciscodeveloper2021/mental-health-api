class EvaluatedsController < ApplicationController

  def initialize
    super

    @service = UseCases::Evaluateds::CrudEvaluatedService.new
  end

  def index
  end

  def show
    evaluated = @service.find_evaluated(params[:id])

    render json: evaluated, status: :ok
  end

  def create
    evaluated = @service.create(evaluated_params)

    render json: evaluated, status: :created
  end

  def update
    updated_evaluated = @service.update(params[:id], evaluated_params)

    render json: evaluated, status: :ok
  end

  def destroy
    update_evaluated = @service.destroy(params[:id])

    render json: { message: "User with #{params[:id]} no longer exists" }, status: :ok
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birthdate)
  end
end
