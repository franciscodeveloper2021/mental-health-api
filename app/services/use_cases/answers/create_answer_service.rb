module UseCases
  module Answers
    class CreateAnswerService

      def initialize(answer_repository = AnswerRepository.new)
        @repository = answer_repository
      end

      def create(params)
        @repository.create(params)
      end
    end
  end
end