class MembersController < ApplicationController

  def index
    @members = Member.order("id")
  end

  def new
    @member = Member.new
  end

  def make_user
    session[:user_name] = member_params[:user_name]
    session[:email] = member_params[:email]
    session[:password] = member_params[:password]
    session[:password_confirmation] = member_params[:password_confirmation]
    session[:administrator] = member_params[:administrator]
    session[:room_id] = member_params[:room_id]
    @member = Member.new(
      user_name: session[:user_name],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      administrator: session[:administrator],
      room_id: session[:room_id]
    )
    if @member.save
      sign_in(@member)
      redirect_to @member
    else 
      render :new
    end
  end

  def show
    if member_signed_in?
      @member = Member.find(params[:id])
    else
      redirect_to root_path
      flash[:notice] = "会員登録をおこなってください"
    end
  end

  def edit
    @member = Member.find(params[:id])
    if member_signed_in? && @member.id == current_member.id
      @member
    else
      redirect_to member_path
      flash[:notice] = "ログインIDが選択した人と異なっています。変更する権利はありません。"
    end
  end

  def update_member
    if current_member.update(member_update_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    # binding.pry
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
      :email,
      :administrator,
      :room_id )
  end

  def member_update_params
    params.require(:member).permit(
      :user_name,
      :password,
      :password_confirmation,
      :email,
      :administrator,
      :room_id )
  end

end
