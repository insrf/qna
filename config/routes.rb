Rails.application.routes.draw do

  resource :questions, shallow: true do
    resource :answers, shallow: true
  end

end
