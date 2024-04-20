require "rails_helper"

RSpec.describe EvaluatedRepository, type: :repository do
  let(:repository) { EvaluatedRepository.new }
  let(:evaluated) { create(:evaluated)}

  context "when there is no register of evaluateds" do
    describe "#index" do
      it "should raise a warning" do
        allow(Evaluated).to receive(:all).and_return([])

        expect(I18n).to receive(:t).with("warnings.nothing", entity: "evaluateds")
        repository.index
      end
    end
  end
  context "when there is at least a register of one evaluated" do
    it "returns evaluateds list" do
      allow(Evaluated).to receive(:all).and_return([evaluated])

      result = repository.index
      expect(result).to include(evaluated)
    end
  end
end