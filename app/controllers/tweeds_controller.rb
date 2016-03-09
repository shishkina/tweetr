class TweedsController < ApplicationController

  def index
    @tweeds = Tweed.all
  end

  def show
    @tweed = Tweed.find(params[:id])
    @comment = Comment.new
    @comment.tweed_id = @tweed.id
  end

  def new
    @tweed = Tweed.new
  end

  def create
    @tweed = Tweed.new tweed_params
    @tweed.save
    redirect_to tweeds_path
  end

  def destroy
    @tweed = Tweed.find(params[:id])
    @tweed.destroy
    redirect_to tweeds_path
  end

  def edit
    @tweed = Tweed.find(params[:id])
  end

  def update
    @tweed = Tweed.find(params[:id])
    @tweed.update tweed_params
    redirect_to tweed_path

  end


  private
  def tweed_params
    params.require(:tweed).permit(:author, :title, :body)
  end
end
