class BoardsController < ApplicationController
  
  def index
    @posts = Board.all.order(created_at: :desc)
  end



  def new
    @post = Board.new
  end

  def show
    @post = Board.find_by({id: params[:id]})
  end

  def edit
  end

  def create

    @post = current_user.boards.new(post_details)
    if @post.save
      redirect_to board_path(@post)
    else 
      redirect_to new_board_path
    end

  end

  def update
  end

  def destroy
  end

  private

    def post_details
      params.require(:board).permit(:title, :description)
    end

    def find_user_post
      @post = current_user.boards.find_by({id: params[:id]})
      unless @post
        redirect_to boards_path(current_user)
      else
        @post
    end
  end
end
