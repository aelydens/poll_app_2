class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question was successfully created"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Question successfully updated"
      redirect_to questions_path
    else
      render :dit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Question successfully removed"
    else
      flash[:error] = "There was an error removing this question"
    end
    redirect_to questions_path
  end
  
  private

  def question_params
    params.require(:question).permit(:question, :poll_id, answer_attributes: [:id, :answer, :_destroy])
  end
end
