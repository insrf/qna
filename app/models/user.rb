class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_questions, class_name: "Question", foreign_key: "author_id"
  has_many :created_answers, class_name: "Answer", foreign_key: "author_id"
end
