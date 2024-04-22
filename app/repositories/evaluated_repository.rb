class EvaluatedRepository

  def initialize(instrument_repo = InstrumentRepository.new )
    @instrument_repo = instrument_repo
  end

  def find_all_evaluateds
    evaluateds = Evaluated.all
    return I18n.t("warnings.nothing", entity: "evaluateds") if evaluateds.empty?

    evaluateds
  end

  def find_evaluated(evaluated_id)
    evaluated = Evaluated.find_by_id(evaluated_id)
    raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Evaluated", attribute: evaluated_id) if evaluated.nil?

    evaluated
  end

  def create(params)
    evaluated = Evaluated.new(params)

    ActiveRecord::Base.transaction do
      evaluated.save!
    end

    evaluated
  end

  def update(evaluated_id, params)
    evaluated = find_evaluated(evaluated_id)

    ActiveRecord::Base.transaction do
      evaluated.update(params)
    end

    evaluated
  end

  def destroy(evaluated_id)
    evaluated = find_evaluated(evaluated_id)

    ActiveRecord::Base.transaction do
      evaluated.destroy
    end
  end

  def assign_instrument(evaluated_id, instrument_id)
    evaluated = find_evaluated(evaluated_id)
    instrument = @instrument_repo.find_instrument(instrument_id)

    if evaluated.instruments.include?(instrument)
      raise RuntimeError, I18n.t("warnings.has_been_assigned", entity: instrument.title, related: evaluated.name)
    end

    ActiveRecord::Base.transaction do
      evaluated.instruments << instrument
    end

    evaluated
  end
end
