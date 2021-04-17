class BooksController < ApplicationController
  def index
  	@books = Book.all
    @book = Book.new
    @user = current_user
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:complete]="Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      @book = Book.new
      render :index
    end
  end


  def show
    @user = current_user
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
   
   def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
       flash[:notice] = "You have creatad book successfully."
       redirect_to  book_path(@book.id)
     else
       @books = Book.all
       flash[:notice]= ' errors prohibited this obj from being saved:'
       render "edit"
     end
   end
   
   def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to "/books"
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

