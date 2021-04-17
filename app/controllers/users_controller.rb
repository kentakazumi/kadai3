class UsersController < ApplicationController
  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end



  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
    end

  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to "/users/#{current_user.id}"
    else
      flash[:notice] = " errors prohibited this obj from being saved:"
      render :edit
    end
  end




  private
  def user_params
  	params.require(:user).permit(:name, :image, :introduction)
  end

end
