FactoryBot.define do
  factory :question do
    content { "Is Rails a happy framework to code with?" }
    association :instrument
  end
end
