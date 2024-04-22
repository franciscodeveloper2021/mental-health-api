FactoryBot.define do
  factory :question do
    association :instrument
    content { "Is Rails a happy framework to code with?" }
    instrument_id { instrument.id }
  end
end
