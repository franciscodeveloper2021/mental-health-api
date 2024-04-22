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
end