require 'rails_helper'

RSpec.describe UseCases::Psychologists::CreatePsychologistService do
  let(:repository) { instance_double("PsychologistRepository") }
  let(:service) { described_class.new(repository) }

  describe "#initialize" do
    it "receives a repository as a dependency" do
      expect(service.instance_variable_get(:@repository)).to eq(repository)
    end
  end
end