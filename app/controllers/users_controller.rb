class UsersController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if
      @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
