require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { build(:question) }

  describe "validations" do
    context "with invalid params" do
      context "when attribute is not present" do
        it "throws an error when content is not present" do
          question.content = nil
          question.valid?

          expect(question.errors.full_messages).to include(I18n.t("errors.blank", attribute: Question.human_attribute_name(:content)))
        end
      end

      context "when attribute's length is invalid" do
        it "throws an error when content's length is less than 5" do
          question.content = "abcd"
          question.valid?

          expect(question.errors.full_messages).to include(I18n.t("errors.short_length", attribute: Question.human_attribute_name(:content), min_length: 5))
        end

        it "throws an error when content's length is more than 400" do
          question.content = "a" * 401
          question.valid?

          expect(question.errors.full_messages).to include(I18n.t("errors.long_length", attribute: Question.human_attribute_name(:content), max_length: 400))
        end
      end
    end

    context "with valid params" do
      it "allows a question to be created" do

        expect(question.valid?).to be(true)
      end
    end
  end
end
