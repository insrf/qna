FactoryBot.define do
  factory :question do
    title "MyString"
    body "MyText"
    author_id 1
  end

  factory :invalid_question, class: "Question" do
    title nil
    body nil
    author_id nil
  end
end
