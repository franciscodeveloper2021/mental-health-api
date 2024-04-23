FactoryBot.define do
  factory :answer do
    association :question
    content { "Yes!" }
    question_id { question.id }
  end
end
