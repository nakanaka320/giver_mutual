class MembersController < ApplicationController

  def index
    @members = Member.order("user_name")
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
    if @member.save
      sign_in(@member)
      redirect_to @member
    else 
      render :new
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  #今後実装　編集
  # def edit
  # end

  # def update
  #   if current_member.update(member_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員を削除しました"
  end

  def sign_in_form
    @member = Member.new
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
