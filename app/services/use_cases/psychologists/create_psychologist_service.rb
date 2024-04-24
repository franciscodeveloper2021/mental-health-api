module UseCases
  module Psychologists
    class CreatePsychologistService

      def initialize(psychologist_repository = PsychologistRepository.new)
        @repository = psychologist_repository
      end

      def create(params)
        @repository.create(params)
      end
    end
  end
end