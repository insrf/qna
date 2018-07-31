require 'rails_helper'

feature 'User can fill form for answer on questions page', %q{
  In order to reply answer on question
  As an User
  I want to fill form of the new answer on question page
} do

  given(:user) { create(:user) }
  given(:question) { create(:question, author_id: user.id) }

  scenario 'Non-authenticated user try to fill form to answer on question page' do
      visit question_path(question)
      fill_in 'Body', with: "some answer"

      click_on 'Create Answer'

      expect(page).to have_content 'You need to log in.'
  end

  scenario 'Authenticated user try to fill form to answer on question page' do
      sign_in(user)

      visit question_path(question)
      fill_in 'Body', with: "some answer"
      click_on 'Create Answer'

      expect(page).to have_content 'Your answer successfully created.'
  end
end
