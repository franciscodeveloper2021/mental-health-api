require 'rails_helper'

RSpec.describe Instrument, type: :model do
  let(:instrument) { build(:instrument) }

  describe "validations" do
    context "with invalid params" do
      context "when attribute is not present" do
        it "throws an error when title is not present" do
          instrument.title = nil
          instrument.valid?

          expect(instrument.errors.full_messages).to include(I18n.t("errors.blank", attribute: Instrument.human_attribute_name(:title)))
        end

        it "throws an error when description is not present" do
          instrument.description = nil
          instrument.valid?

          expect(instrument.errors.full_messages).to include(I18n.t("errors.blank", attribute: Instrument.human_attribute_name(:description)))
        end
      end

      context "when attribute's length is invalid" do
        it "throws an error when title's length is less than 5" do
          instrument.title = "abc"
          instrument.valid?

          expect(instrument.errors.full_messages).to include(I18n.t("errors.short_length", attribute: Instrument.human_attribute_name(:title), min_length: 5))
        end

        it "throws an error when title's length is more than 40" do
          instrument.title = "a" * 41
          instrument.valid?

          expect(instrument.errors.full_messages).to include(I18n.t("errors.long_length", attribute: Instrument.human_attribute_name(:title), max_length: 40))
        end

        it "throws an error when description's length is less than 10" do
          instrument.description = "a" * 9
          instrument.valid?

          expect(instrument.errors.full_messages).to include(I18n.t("errors.short_length", attribute: Instrument.human_attribute_name(:description), min_length: 10))
        end

        it "throws an error when description's length is more than 300" do
          instrument.description = "a" * 301
          instrument.valid?

          expect(instrument.errors.full_messages).to include(I18n.t("errors.long_length", attribute: Instrument.human_attribute_name(:description), max_length: 300))
        end
      end
    end

    context "with valid params" do
      it "allows an instrument to be created" do
        expect(instrument.valid?).to be(true)
      end
    end
  end


  describe "#update_status" do
    context "when all questions have associated answers" do
      let(:instrument) { create(:instrument) }

      before do
        create_list(:question, 3, instrument: instrument)
        instrument.questions.each do |question|
          create(:answer, question: question)
        end
      end

      it "updates the status to done" do
        instrument.update_status
        expect(instrument.status).to eq("done")
      end
    end

    context "when not all questions have associated answers" do
      let(:instrument) { create(:instrument) }

      before do
        create_list(:question, 3, instrument: instrument)
      end

      it "updates the status to pendent" do
        instrument.update_status
        expect(instrument.status).to eq("pendent")
      end
    end

    context "when there are no questions" do
      let(:instrument) { create(:instrument) }

      it "updates the status to pendent" do
        instrument.update_status
        expect(instrument.status).to eq("pendent")
      end
    end

    context "when some questions have associated answers and some don't" do
      let(:instrument) { create(:instrument) }

      before do
        create_list(:question, 2, instrument: instrument)
        create(:answer, question: instrument.questions.first)
      end

      it "updates the status to pendent" do
        instrument.update_status
        expect(instrument.status).to eq("pendent")
      end
    end
  end
end
