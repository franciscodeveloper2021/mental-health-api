require 'rails_helper'

RSpec.describe Psychologist, type: :model do
  let(:psychologist) { build(:psychologist) }

  describe "validations" do
    context "with invalid params" do
      context "when attribute is not present" do
        it "throws an error when name is not present" do
          psychologist.name = nil
          psychologist.valid?

          expect(psychologist.errors.full_messages).to include(I18n.t("errors.blank", attribute: Psychologist.human_attribute_name(:name)))
        end

        it "throws an error when password is not present" do
          psychologist.password = nil
          psychologist.valid?

          expect(psychologist.errors.full_messages).to include(I18n.t("errors.blank", attribute: Psychologist.human_attribute_name(:password)))
        end
      end
    end

    context "when attribute's length is invalid" do
      it "throws an error when name's length is less than 2" do
        psychologist.name = "a"
        psychologist.valid?

        expect(psychologist.errors.full_messages).to include(I18n.t("errors.short_length", attribute: Psychologist.human_attribute_name(:name), min_length: 2))
      end

      it "throws an error when name's length is more than 50" do
        psychologist.name = "a" * 51
        psychologist.valid?

        expect(psychologist.errors.full_messages).to include(I18n.t("errors.long_length", attribute: Psychologist.human_attribute_name(:name), max_length: 50))
      end
    end

    context "with valid params" do
      it "allows psychologist to be created" do
        expect(psychologist.valid?).to be(true)
      end
    end
  end
end

