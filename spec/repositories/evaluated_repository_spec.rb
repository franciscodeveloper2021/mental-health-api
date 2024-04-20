require "rails_helper"

RSpec.describe EvaluatedRepository, type: :repository do
  let(:repository) { EvaluatedRepository.new }
  let(:evaluated) { create(:evaluated)}

  context "when there is no register of evaluateds" do
    describe "#find_all_evaluateds" do
      it "should raise a warning" do
        allow(Evaluated).to receive(:all).and_return([])

        expect(I18n).to receive(:t).with("warnings.nothing", entity: "evaluateds")

        repository.find_all_evaluateds
      end
    end
  end
  context "when there is at least a register of one evaluated" do
    describe "#find_all_evaluateds" do
      it "returns evaluateds list" do
        allow(Evaluated).to receive(:all).and_return([evaluated])

        result = repository.find_all_evaluateds

        expect(result).to include(evaluated)
      end
    end
  end

  context "when evaluted is not present on registers" do
    describe "#find_evaluated" do
      it "should raise an Argument error" do
        allow(Evaluated).to receive(:find_by_id).and_return(nil)

        expect {
          repository.find_evaluated(404)
        }.to raise_error(ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Evaluated", attribute: 404))
      end
    end
  end
  context "when evaluted is present on registers" do
    describe "#find_evaluated" do
      it "should return evaluted" do
        allow(Evaluated).to receive(:find_by_id).and_return(evaluated)

        found_evaluated = repository.find_evaluated(evaluated.id)

        expect(found_evaluated).to be_present
      end
    end
  end

  context "when params are invalid to be updated" do
    describe "#update" do
      it "does not update record" do
        invalid_params = { name: "" }

        repository.update(evaluated.id, invalid_params)

        expect(evaluated.reload.name).not_to eq("")
      end
    end
  end
  context "when params valid to be updated" do
    describe "#update" do
      it "updates record" do
        valid_params = { name: "New Name" }

        repository.update(evaluated.id, valid_params)

        expect(evaluated.reload.name).to eq("New Name")
      end
    end
  end

  context "when params are invalid to be created" do
    describe "#create" do
      it "does not update record" do
        invalid_params = {
          name: "W",
          email: "invalid",
          cpf: "00000",
          birthdate: ""
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
          name: "William",
          email: "williambible@gmail.com",
          cpf: "529.982.247-25",
          birthdate: "10/09/2000"
        }

        created_evaluted = repository.create(valid_params)

        expect(created_evaluted).to be_present
      end
    end
  end

  context "when record is destroyed" do
    describe "destroy" do
      it "expects to no longer find it on database" do
        destroyed_evaluated = repository.destroy(evaluated.id)

        expect { repository.find_evaluated(evaluated.id)
        }.to raise_error(ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Evaluated", attribute: evaluated.id))
      end
    end
  end
end