class EvaluatedsController < ApplicationController
  before_action :authenticate_psychologist!

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

    if result
      evaluated_email = result.email
      instrument_link = "http://mocklink"
      NotifierMailer.instrument_assigned_email(evaluated_email, instrument_link).deliver_now
    end

    render json: { evaluated: result, instruments: result.instruments }, status: :ok
  end

  def show_evaluted_and_related_instruments
    evaluated = @service.show(params[:id])

    instruments_with_questions = evaluated.instruments.includes(questions: :answer)

    data = {
      evaluated: evaluated,
      instruments_with_questions: instruments_with_questions.map do |instrument|
        {
          instrument: instrument,
          questions: instrument.questions.map do |question|
            {
              question: question,
              answer: question.answer
            }
          end
        }
      end
    }

    render json: data, status: :ok
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birthdate)
  end

  def authenticate_psychologist!
    @current_psychologist = Authentication::Authenticator.authenticate_psychologist!(request)
  rescue JWT::DecodeError
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
