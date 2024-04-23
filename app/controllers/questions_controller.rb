class QuestionsController < ApplicationController

  def initialize
    super

    @service = UseCases::Questions::CrudQuestionService.new
  end

  def create
    question = @service.create(question_params)

    render json: question, status: :created
  end

  def update
    updated_question = @service.update(params[:id], question_params)

    render json: updated_question, status: :ok
  end

  def destroy
    question = @service.destroy(params[:id])

    render json: { message: I18n.t("warnings.destroyed", record: question[:content]) }, status: :ok
  end

  private

  def question_params
    params.require(:question).permit(:instrument_id, :content)
  end
end
