require 'rails_helper'

RSpec.describe User do
  context "associates" do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end

  context "validation" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

  context "author_of?" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:question) { create(:question, author: user) }
    let!(:answer) { create(:answer, question_id: question.id, author: user) }

    it "author item" do
      expect(user.author_of?(question)).to eq(true)
      expect(user.author_of?(answer)).to eq(true)
    end

    it "another user item" do
      expect(user2.author_of?(question)).to eq(false)
      expect(user2.author_of?(answer)).to eq(false)
    end
  end
end
