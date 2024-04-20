class EvaluatedRepository
  def index
    evaluateds = Evaluated.all
    return I18n.t("warnings.nothing", entity: "evaluateds") if evaluateds.empty?

    evaluateds
  end

  def show
    
  end

  def create
  end

  def update
  end

  def destroy
  end
end