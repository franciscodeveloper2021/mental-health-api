require "rails_helper"

RSpec.describe InstrumentRepository, type: :repository do
  let(:repository) { InstrumentRepository.new }
  let(:instrument) { create(:instrument)}

  context "when there is no register of instruments" do
    describe "#find_all_instruments" do
      it "should raise a warning" do
        allow(Instrument).to receive(:all).and_return([])

        expect(I18n).to receive(:t).with("warnings.nothing", entity: "instruments")

        repository.find_all_instruments
      end
    end
  end
  context "when there is at least a register of one instrument" do
    describe "#find_all_instruments" do
      it "returns instruments list" do
        allow(Instrument).to receive(:all).and_return([instrument])

        result = repository.find_all_instruments

        expect(result).to include(instrument)
      end
    end
  end

  context "when instrument is not present on registers" do
    describe "#find_instrument" do
      it "should raise an Argument error" do
        allow(Instrument).to receive(:find_by_id).and_return(nil)

        expect {
          repository.find_instrument(404)
        }.to raise_error(ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Instrument", attribute: 404))
      end
    end
  end
  context "when instrument is present on registers" do
    describe "#find_instrument" do
      it "should return instrument" do
        allow(Instrument).to receive(:find_by_id).and_return(instrument)

        found_instrument = repository.find_instrument(instrument.id)

        expect(found_instrument).to be_present
      end
    end
  end

  context "when params are invalid to be created" do
    describe "#create" do
      it "does not update record" do
        invalid_params = {
          title: "T",
          description: "D"
        }

        expect {
          repository.create(invalid_params)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
  context "when params are valid to be created" do
    describe "#create" do
      it "creates a record" do
        valid_params = {
          title: Faker::Lorem.sentence(word_count: 3),
          description: Faker::Lorem.paragraph(sentence_count: 2)
        }

        created_instrument = repository.create(valid_params)

        expect(created_instrument).to be_present
      end
    end
  end

  context "when params are invalid to be updated" do
    describe "#update" do
      it "does not update record" do
        invalid_params = { title: "" }

        repository.update(instrument.id, invalid_params)

        expect(instrument.reload.title).not_to eq("")
      end
    end
  end
  context "when params valid to be updated" do
    describe "#update" do
      it "updates record" do
        valid_params = { title: "New title" }

        repository.update(instrument.id, valid_params)

        expect(instrument.reload.title).to eq(valid_params[:title])
      end
    end
  end

  context "when record is destroyed" do
    describe "destroy" do
      it "expects to no longer find it on database" do
        destroyed_instrument = repository.destroy(instrument.id)

        expect { repository.find_instrument(instrument.id)
        }.to raise_error(ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Instrument", attribute: instrument[:id]))
      end
    end
  end
end