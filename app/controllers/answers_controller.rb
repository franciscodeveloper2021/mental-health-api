class AnswersController < ApplicationController

  def initialize
    super

    @service = UseCases::Answers::CreateAnswerService.new
  end

  def create
    answer = @service.create(answer_params)
    question = answer.question

    render json: {
      question: question,
      answer: answer
    }
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :content)
  end
end
