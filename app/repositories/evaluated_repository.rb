class EvaluatedRepository

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
end
