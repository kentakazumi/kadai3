class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = BookComment.find(params[:book_id])
    @comment.destroy
    render :index
  end

    private
    def comment_params
      params.require(:book_comment).permit(:comment, :book_id, :user_id)
    end
end
