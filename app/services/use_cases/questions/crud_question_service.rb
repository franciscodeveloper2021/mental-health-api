module UseCases
  module Questions
    class CrudQuestionService

      def initialize(repository = QuestionRepository.new )
        @repository = repository
      end

      def create(params)
        @repository.create(params)
      end

      def update(question_id, params)
        @repository.update(question_id, params)
      end

      def destroy(question_id)
        @repository.destroy(question_id)
      end
    end
  end
end
