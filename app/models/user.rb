class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, class_name: "Question", foreign_key: "author_id"
  has_many :answers, class_name: "Answer", foreign_key: "author_id"

  def author_of?(item)
    self.id == item.author_id
  end
end
