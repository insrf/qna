class Answer < ApplicationRecord
  belongs_to :question, optional: true

  validates :title, :body, presence: true
end
