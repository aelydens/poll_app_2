class QuestionsController < ApplicationController
  before_action :set_poll

  def index
    @questions = @poll.questions.all
  end

  def new
    @question = @poll.questions.new
  end

  def create
    @question = @poll.questions.new(question_params)
    if @question.save
      flash[:success] = "Question was successfully created"
      redirect_to poll_questions_path(@poll)
    else
      render :new
    end
  end

  def edit
    @question = @poll.questions.find(params[:id])
  end

  def update
    @question = @poll.questions.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Question successfully updated"
      redirect_to poll_questions_path(@poll)
    else
      render :edit
    end
  end

  def destroy
    @question = @poll.questions.find(params[:id])
    if @question.destroy
      flash[:success] = "Question successfully removed"
    else
      flash[:error] = "There was an error removing this question"
    end
    redirect_to poll_questions_path(@poll)
  end

  private

  def question_params
    params.require(:question).permit(:question, :poll_id, answers_attributes: [:id, :answer, :_destroy])
  end

  def set_poll
    @poll = Poll.find_by_id(params[:poll_id])
  end
end
