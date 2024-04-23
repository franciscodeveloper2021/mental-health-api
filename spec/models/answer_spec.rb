require "rails_helper"

RSpec.describe Answer, type: :model do
  let(:answer) { create(:answer) }

  describe "validations" do
    context "with invalid params" do
      context "when attribute is not present" do
        it "throws an error when content is not present" do
          answer.content = nil
          answer.valid?

          expect(answer.errors.full_messages).to include(I18n.t("errors.blank", attribute: Answer.human_attribute_name(:content)))
        end

        it "doesn't allwo answer to be created" do
          answer.question_id = nil

          expect(answer.invalid?).to be(true)
        end
      end
    end

    context "with valid params" do
      it "allows an answer to be created" do
        expect(answer.valid?).to be(true)
      end
    end
  end

  describe "#update_instrument_status" do
    let(:question) { create(:question) }
    let(:instrument) { question.instrument }

    it "updates the instrument status after creating an answer" do
      expect(instrument.status).to eq("pendent")

      create(:answer, question: question)

      expect(instrument.reload.status).to eq("done")
    end
  end
end
