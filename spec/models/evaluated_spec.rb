require 'rails_helper'

RSpec.describe Evaluated, type: :model do
  let(:evaluated) { build(:evaluated) }

  describe "validates" do
    context "with invalid params" do
      context "when attribute is not present" do
        it "throws an error when name is not present" do
          evaluated.name = nil
          evaluated.valid?

          expect(evaluated.errors.full_messages).to include(I18n.t("errors.blank", attribute: Evaluated.human_attribute_name(:name)))
        end

        it "throws an error when email is not present" do
          evaluated.email = nil
          evaluated.valid?

          expect(evaluated.errors.full_messages).to include(I18n.t("errors.blank", attribute: Evaluated.human_attribute_name(:email)))
        end

        it "throws an error when cpf is not present" do
          evaluated.cpf = nil
          evaluated.valid?

          expect(evaluated.errors.full_messages).to include(I18n.t("errors.blank", attribute: Evaluated.human_attribute_name(:cpf)))
        end

        it "throws an error when birthdate is not present" do
          evaluated.birthdate = nil
          evaluated.valid?

          expect(evaluated.errors.full_messages).to include(I18n.t("errors.blank", attribute: Evaluated.human_attribute_name(:birthdate)))
        end
      end

      context "when attribute's length is invalid" do
        it "throws an error when name's length is less than 2" do
          evaluated.name.slice!(1..)
          evaluated.valid?

          expect(evaluated.errors.full_messages).to include(I18n.t("errors.short_length", attribute: Evaluated.human_attribute_name(:name), min_length: 2))
        end

        it "throws an error when name's length is more than 50" do
          evaluated.name *= 51
          evaluated.valid?

          expect(evaluated.errors.full_messages).to include(I18n.t("errors.long_length", attribute: Evaluated.human_attribute_name(:name), max_length: 50))
        end

        it "throws an error when email length is more than 254" do
          evaluated.email *= 255
          evaluated.valid?

          expect(evaluated.errors.full_messages).to include(I18n.t("errors.long_length", attribute: Evaluated.human_attribute_name(:email), max_length: 254))
        end
      end
    end

    context "when attribute's formatting is invalid" do
      it "throws an error when cpf format is invalid" do
        evaluated.cpf = "12345678901"
        evaluated.valid?

        expect(evaluated.errors.full_messages).to include(I18n.t("errors.unformatted", attribute: Evaluated.human_attribute_name(:cpf), formatting: "xxx.xxx.xxx-xx"))
      end

      it "throws an error when email format is invalid" do
        evaluated.email = "invalid_email_format"
        evaluated.valid?

        expect(evaluated.errors.full_messages).to include(I18n.t("errors.invalid", attribute: Evaluated.human_attribute_name(:email)))
      end
    end

    context "when attribute has been already taken" do
      before do
        existing_evaluated = create(:evaluated, email: evaluated.email, cpf: evaluated.cpf)
      end

      it "throws an error when email is already taken" do
        evaluated.valid?

        expect(evaluated.errors.full_messages).to include(I18n.t("errors.taken", attribute: Evaluated.human_attribute_name(:email)))
      end

      it "throws an error when cpf is already taken" do
        evaluated.valid?

        expect(evaluated.errors.full_messages).to include(I18n.t("errors.taken", attribute: Evaluated.human_attribute_name(:cpf)))
      end
    end

    context "with valid params" do
      it "allows evaluated person to be created" do
        expect(evaluated.valid?).to be(true)
      end
    end
  end
end
