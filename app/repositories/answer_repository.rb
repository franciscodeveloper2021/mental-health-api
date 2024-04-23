class AnswerRepository

  def create(params)
    question = Question.find_by_id(params[:question_id])
    unless question
      raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Question", attribute: params[:question_id])
    end

    ActiveRecord::Base.transaction do
      answer = Answer.new(params)
      answer.save!
      answer
    end
  end
end
