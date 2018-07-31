require 'rails_helper'

RSpec.describe User do
  it { should have_many(:created_questions) }
  it { should have_many(:created_answers) }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end
