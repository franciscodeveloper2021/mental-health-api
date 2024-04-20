module UseCases
  module Evaluateds
    class CrudEvaluatedService

      def initialize(repository = EvaluatedRepository.new)
        @repository = repository
      end

      def index
        @repository.find_all_evaluateds
      end

      def show(evaluated_id)
        @repository.find_evaluated(evaluated_id)
      end

      def create(params)
        @repository.create(params)
      end

      def update(evaluated_id, params)
        @repository.update(evaluated_id, params)
      end

      def destroy(evaluated_id)
        @repository.destroy(evaluated_id)
      end
    end
  end
end