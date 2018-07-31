require 'rails_helper'

feature 'Only an authenticated user can create questions and answers', %q{
  In order to make answers and questions
  As an authenticated user
  I want to create answers and questions
} do

  given(:user) { create(:user) }
  given(:question) { create(:question, author_id: user.id)}

  scenario 'authenticated user creates question' do
    sign_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'text text'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created.'
  end

  scenario "Non-authenticated user creates question" do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'authenticated user creates answer' do
    sign_in(user)

    visit question_path(question)

    fill_in 'Body', with: 'text text'
    click_on 'Create Answer'

    expect(page).to have_content 'Your answer successfully created.'
  end

  scenario "Non-authenticated user creates question" do
    visit question_path(question)
    fill_in 'Body', with: 'text text'
    click_on 'Create Answer'

    expect(page).to have_content 'You need to log in.'
  end
end
