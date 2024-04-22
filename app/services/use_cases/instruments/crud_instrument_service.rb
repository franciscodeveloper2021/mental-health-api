module UseCases
  module Instruments
    class CrudInstrumentService

      def initialize(repository = InstrumentRepository.new)
        @repository = repository
      end

      def index
        @repository.find_all_instruments
      end

      def show(instrument_id)
        @repository.find_instrument(instrument_id)
      end

      def create(params)
        @repository.create(params)
      end

      def update(instrument_id, params)
        @repository.update(instrument_id, params)
      end

      def destroy(instrument_id)
        @repository.destroy(instrument_id)
      end
    end
  end
end
