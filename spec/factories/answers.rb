FactoryBot.define do
  factory :answer do
    body "MyText"
    question_id 1
    author_id 1
  end

  factory :invalid_answer, class: "Answer" do
    body nil
    question_id nil
    author_id nil
  end

end
