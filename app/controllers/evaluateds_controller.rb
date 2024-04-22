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
    evaluated = @service.destroy(params[:id])

    render json: { message: I18n.t("warnings.destroyed", record: evaluated[:name]) }, status: :ok
  end

  def assign_instrument
    result = @service.assign_instrument(params[:id], params[:instrument_id])

    render json: { evaluated: result, instruments: result.instruments }, status: :ok
  end

  def show_evaluted_and_related_instruments
    evaluated = @service.show(params[:id])

    render json: { evaluated: evaluated, instruments: evaluated.instruments }, status: :ok
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birthdate)
  end
end
