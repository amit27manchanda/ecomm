class AnswersController < ApplicationController
  before_action :set_product, only: [:new, :create, :edit, :update]
  before_action :set_question,only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @answers= Answer.all
  end

  def show
    @answer= Answer.find(params[:id])
  end

  def new 
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    @answer.save
    redirect_to product_questions_path
   end
  
  def edit
    @answer= @question.answers.find(params[:id])
    end

  def update
    @answer= @question.answers.find(params[:id])
    @answer.update(answer_params)
    redirect_to product_questions_path
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to product_questions_path
    end
  
  private
  def answer_params
      params.require(:answer).permit(:content)
    end
  def set_product
    @product= Product.find(params[:product_id])
  end
  def set_question
    @question= Question.find(params[:question_id])
  end
end
