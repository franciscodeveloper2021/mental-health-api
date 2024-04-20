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

    evaluated.save!

    evaluated
  end

  def update(evaluated_id, params)
    evaluated = find_evaluated(evaluated_id)

    evaluated.update(params)
  end

  def destroy(evaluated_id)
    evaluated = find_evaluated(evaluated_id)

    evaluated.destroy
  end
end
