class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params.require(:poll).permit(:topic))
    if @poll.save
      redirect_to polls_path
    else
      render :new
    end
  end
end
