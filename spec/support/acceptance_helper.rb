module AcceptanceHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def sign_out
    visit '/'
    click_on 'log_out'
  end

  def create_question(title, text)
    visit questions_path
    click_on 'Ask question'

    fill_in 'Title', with: title
    fill_in 'Body', with: text
    click_on 'Create'
  end

  def create_answer(question, text)
    visit question_path(question)
    fill_in 'Body', with: text

    click_on 'Create Answer'
  end
end
