class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %w[index show]
  before_action :load_question, only: %w[show edit update destroy]
  before_action :load_answer, only: %w[show]

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.new
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.created_questions.new(question_params)

    if @question.save
      flash[:notice] = 'Your question successfully created.'
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params) || validates_user?
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    if validates_user?
      @question.destroy
      flash[:notice] = 'you successfully deleted'
      redirect_to questions_path
    else
      flash[:notice] = 'you do not have enough rights'
      redirect_to questions_path
    end
  end

  private

  def validates_user?
    current_user.id == @question.author_id
  end

  def load_question
    @question = Question.find(params[:id])
  end

  def load_answer
    @answer = Answer.where(question_id: params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
