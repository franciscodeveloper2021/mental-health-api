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
end
