class QuestionRepository

  def initialize(instrument_repository = InstrumentRepository.new )
    @instrument_repository = instrument_repository
  end

  def create(params)
    instrument = @instrument_repository.find_instrument(params[:instrument_id])
    question = Question.new(params)

    if instrument.questions.exists?(content: question.content)
      raise RuntimeError, I18n.t("warnings.has_been_assigned", entity: question.content, related: instrument.name)
    end

    ActiveRecord::Base.transaction do
      question.save!
    end

    question
  end

  def destroy(question_id)
    question = Question.find_by_id(question_id)
    raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Question", attribute: question_id) if question.nil?

    ActiveRecord::Base.transaction do
      question.destroy!
    end
  end
end