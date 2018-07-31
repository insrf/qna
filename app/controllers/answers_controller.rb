class AnswersController < ApplicationController
  before_action :load_answer, only: %w[show edit update destroy]
  before_action :load_question, only: %w[new create]

  def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)

    if user_signed_in?
      @answer[:author_id] = current_user.id
      if @answer.save
        flash[:notice] = 'Your answer successfully created.'
        redirect_to @answer
      else
        render :new
      end
    else
      flash[:notice] = 'You need to log in.'
      redirect_to @answer.question
    end
  end

  def update
    if @answer.update(answer_params) || validates_user?
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    if validates_user?
      @answer.destroy
      flash[:notice] = 'you successfully deleted'
      redirect_to question_path(@answer.question)
    else
      flash[:notice] = 'you do not have enough rights'
      redirect_to question_path(@answer.question)
    end
  end

  private

  def validates_user?
    current_user.id == @answer.author_id
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def load_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
