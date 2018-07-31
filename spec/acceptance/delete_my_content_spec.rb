require 'rails_helper'

feature 'User can delete only him questions and answers', %q{
  In order to delete questions and answers
  As an authenticated user
  I want to delete only my questions and answers
} do

  given(:user1) { create(:user) }
  given(:user2) { create(:user) }
  given(:question) { create(:question, author_id: user1.id) }

  scenario 'user1 try to delete user1 question' do
    sign_in(user1)
    visit questions_path

    create_question('Test question', 'text text')
    visit questions_path
    click_on 'Delete'

    expect(page).to have_content "you successfully deleted"
  end

  scenario 'user1 try to delete user2 question' do
    sign_in(user2)
    visit questions_path

    create_question('Test question', 'text text')
    sign_out

    sign_in(user1)
    visit questions_path

    expect(page).to have_no_content "Delete"
  end

  scenario 'user1 try to delete user1 answer' do
    sign_in(user1)

    create_answer(question, 'Text Answer')
    visit question_path(question)

    click_on 'Delete'

    expect(page).to have_content "you successfully deleted"
  end

  scenario 'user2 try to delete user1 answer' do
    sign_in(user1)

    create_answer(question, 'Text Answer')
    sign_out
    sign_in(user2)

    visit question_path(question)

    expect(page).to have_no_content "Delete"
  end

end
