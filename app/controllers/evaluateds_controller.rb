class EvaluatedsController < ApplicationController

  def initialize
    super

    @service = UseCases::Evaluateds::CrudEvaluatedService.new
  end

  def index
    evaluateds = @service.index

    render json: evaluateds, status: :ok
  end

  def show
    evaluated = @service.show(params[:id])

    render json: evaluated, status: :ok
  end

  def create
    evaluated = @service.create(evaluated_params)

    render json: evaluated, status: :created
  end

  def update
    updated_evaluated = @service.update(params[:id], evaluated_params)

    render json: updated_evaluated, status: :ok
  end

  def destroy
    update_evaluated = @service.destroy(params[:id])

    render json: { message: I18n.t("errors.no_longer_exists", entity: "User", attribute: params[:id]) }, status: :ok
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birthdate)
  end
end
