require "rails_helper"

RSpec.describe QuestionRepository, type: :repository do
  let(:repository) { QuestionRepository.new }
  let(:instrument) { create(:instrument) }
  let(:question)   { create(:question) }

  context "when params are invalid to be created" do
    describe "#create" do
      it "does not create a record" do
        invalid_params = {
          content: "Is Rails a happy framework to code with?",
          instrument_id: -1
        }

        expect {
          repository.create(invalid_params)
        }.to raise_error(ActiveRecord::RecordNotFound,
          I18n.t("errors.not_found", record: "Instrument", attribute: invalid_params[:instrument_id]
          ))

        expect(Question.count).to eq(0)
      end
    end
  end
  context "when params are valid to be created" do
    describe "#create" do
      it "creates a record" do
        valid_params = {
          content: "Is Rails a happy framework to code with?",
          instrument_id: instrument.id
        }

        created_question = repository.create(valid_params)

        expect(created_question).to be_present
        expect(Question.count).to eq(1)
      end
    end
  end

  context "when record exists" do
    describe "#destroy" do
      it "destroys the record" do
        repository.destroy(question.id)

        expect(Question.exists?(question.id)).to be_falsey
      end
    end
  end
  context "when record does not exist" do
    describe "#destroy" do
      it "raises ActiveRecord::RecordNotFound" do
        expect {
          repository.destroy(-1)
        }.to raise_error(ActiveRecord::RecordNotFound,
                         I18n.t("errors.not_found", record: "Question", attribute: -1))
      end
    end
  end
end
