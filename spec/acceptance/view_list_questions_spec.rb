require 'rails_helper'

feature 'Users can see questions and answers', %q{
  In order to see questions and answers
  As an user
  I want to see questions and answers
} do

  given(:user) { create(:user) }
  given(:question) { create(:question, author_id: user.id)}

  scenario 'authenticated user see questions' do
    sign_in(user)
    create_question('Test question', 'text text')

    visit questions_path

    click_link('Test question')

    expect(page).to have_content 'Test question'
    expect(page).to have_content 'text text'
  end

  scenario 'Non-authenticated user see questions' do
    sign_in(user)
    create_question('Test question', 'text text')

    sign_out

    visit questions_path

    click_link('Test question')

    expect(page).to have_content 'Test question'
    expect(page).to have_content 'text text'
  end

  scenario 'authenticated user see answers' do
    sign_in(user)
    create_question('Test question', 'text text')
    create_answer(question, 'Test answer')

    visit question_path(question)

    expect(page).to have_content 'Test answer'
  end

  scenario 'Non-authenticated user see answers' do
    sign_in(user)
    create_answer(question, 'Test answer')

    sign_out

    visit question_path(question)

    expect(page).to have_content 'Test answer'
  end
end
