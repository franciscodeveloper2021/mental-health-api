require "rails_helper"

RSpec.describe AnswerRepository, type: :repository do
  let(:repository) { AnswerRepository.new }
  let(:question)   { create(:question) }
  let(:answer)     { create(:answer, question: question) }

  context "when params are invalid to be created" do
    describe "#create" do
      it "does not create a record if the question does not exist" do
        invalid_params = {
          content: "Yes!",
          question_id: -1
        }

        expect {
          repository.create(invalid_params)
        }.to raise_error(ActiveRecord::RecordNotFound,
          I18n.t("errors.not_found", record: "Question", attribute: invalid_params[:question_id]
          ))

        expect(Answer.count).to eq(0)
      end
    end
  end
  context "when params are valid to be created" do
    describe "#create" do
      it "creates a record" do
        valid_params = {
          content: "Yes!",
          question_id: question.id
        }

        created_answer = repository.create(valid_params)

        expect(created_answer).to be_present
        expect(Answer.count).to eq(1)
      end
    end
  end
end
