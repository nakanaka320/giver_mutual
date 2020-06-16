class MembersController < ApplicationController

  def index
    # @members = Member.order("name")
  end

  def new
    @member = Member.new
  end

  def make_user
    @member = Member.new(member_params)
    binding.pry
    if @member.save
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
