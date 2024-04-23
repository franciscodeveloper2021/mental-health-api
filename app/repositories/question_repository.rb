class QuestionRepository

  def initialize(instrument_repository = InstrumentRepository.new )
    @instrument_repository = instrument_repository
  end

  def create(params)
    instrument = @instrument_repository.find_instrument(params[:instrument_id])
    question = Question.new(params)

    if instrument.questions.exists?(content: question.content)
      raise RuntimeError, I18n.t("warnings.has_been_assigned", entity: question.content, related: instrument.title)
    end

    ActiveRecord::Base.transaction do
      question.save!
    end

    question
  end

  def update(question_id, params)
    question = find_question(question_id)

    ActiveRecord::Base.transaction do
      question.update(params)
    end

    question
  end

  def destroy(question_id)
    question = find_question(question_id)

    ActiveRecord::Base.transaction do
      question.destroy!
    end
  end

  private

  def find_question(question_id)
    question = Question.find_by_id(question_id)
    raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Question", attribute: question_id) if question.nil?

    question
  end
end