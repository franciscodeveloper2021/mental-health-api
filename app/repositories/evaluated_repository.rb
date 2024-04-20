class EvaluatedRepository
  def index
    evaluateds = Evaluated.all
    return I18n.t("warnings.nothing", entity: "evaluateds") if evaluateds.empty?

    evaluateds
  end

  def show(evaluated_id)
    evaluated = Evaluated.find_by_id(evaluated_id)
    raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Evaluated", attribute: evaluated_id) if evaluated.nil?

    evaluated
  end

  def create
  end

  def update
  end

  def destroy
  end
end