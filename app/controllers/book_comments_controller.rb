class BookCommentsController < ApplicationController

def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    @book_comment.save
    redirect_to book_path(@book)
end

def destroy
  book_comment = BookComment.find(params[:id])
  @book = Book.find(params[:book_id])
  @comment_new = BookComment.new
  book_comment.destroy
  redirect_to book_path(@book)
end

def show
 @book = Book.find(params[:book_id])
 @book_comment = current_user.book_comments.new(book_comment_params)
end

private

def book_comment_params
 params.require(:book_comment).permit(:comment)
end

end
