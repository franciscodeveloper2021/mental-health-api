require "rails_helper"

RSpec.describe PsychologistRepository, type: :repository do
  let(:repository) { PsychologistRepository.new }

  context "when params are invalid to be created" do
    describe "#create" do
      it "does not create a record if the name is blank" do
        invalid_params = { name: "", password: "password" }

        expect {
          repository.create(invalid_params)
        }.to raise_error(ActiveRecord::RecordInvalid)

        expect(Psychologist.count).to eq(0)
      end

      it "does not create a record if the password is missing" do
        invalid_params = { name: "John Doe", password: "" }

        expect {
          repository.create(invalid_params)
        }.to raise_error(ActiveRecord::RecordInvalid)

        expect(Psychologist.count).to eq(0)
      end
    end
  end

  context "when params are valid to be created" do
    describe "#create" do
      it "creates a record" do
        valid_params = { name: "John Doe", password: "password" }

        created_psychologist = repository.create(valid_params)

        expect(created_psychologist).to be_present
        expect(Psychologist.count).to eq(1)
      end
    end
  end
end
