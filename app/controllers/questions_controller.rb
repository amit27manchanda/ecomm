class QuestionsController < ApplicationController
  before_action :set_product, only: [:index,:new, :show, :create, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  
  
  def index
    @questions= Question.all
  end

  def new
   @question = Question.new
  end

  def show
     @question= Question.find(params[:id])
     @question= @product.questions.find(params[:id])
  end

  def create
    @question = @product.questions.create(question_params)
    @question.user = current_user
    @question.save
    redirect_to product_questions_path(@product)
    end

  def edit
      @question= @product.questions.find(params[:id])
  end

  def update
     @question= @product.questions.find(params[:id])
     @question.update(question_params)
     redirect_to product_questions_path(@product)
     end

  def destroy
    @question= @product.questions.find(params[:id])
    @question.destroy
    redirect_to product_questions_path(@product)
   end

  private

    def set_product
      @product= Product.find(params[:product_id])
    end

    def question_params
      params.require(:question).permit(:content)
    end
end
