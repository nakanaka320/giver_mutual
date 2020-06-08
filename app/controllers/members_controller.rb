class MembersController < ApplicationController

  def index
    # @members = Member.order("name")
  end

  def show
    # @member = Member.find(params[:id])
  end
  
  def new
    # @member = Member.new
  end
  
  def create
    puts "hallow"
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
      :user_name)
  end

end
