class MembersController < ApplicationController

  def index
    # @members = Member.order("name")
  end

  def new
    @member = Member.new
  end

  def make_user
    session[:user_name] = member_params[:user_name]
    session[:email] = member_params[:email]
    session[:password] = member_params[:password]
    session[:password_confirmation] = member_params[:password_confirmation]
    @member = Member.new(
      user_name: session[:user_name],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
    )
    # binding.pry
    if @member.save
      # sign_in(@member)　のちに実装
      redirect_to @member
    else 
      render :new
    end
  end

  def show
   puts "あほほ" # @member = Member.find(params[:make_user)
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update

  end
  
  def destroy
    
  end

  private
  def member_params
    params.require(:member).permit(
      :user_name,
      :password,
      :password_confirmation,
      :email )
  end

end
