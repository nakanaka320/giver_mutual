class MessagesController < ApplicationController
  before_action :set_room

  def index
    # @member = Member.find(session[:current_member.id])
    @message = Message.new
    @messages = @room.messages.includes(:member)
    # @test = @room.messages.includes(:current_member)
    # @tasks = Task.find(current_member.tasks.ids)
    # @test = Meesage.member_id
    # binding.pry
  end

  def make_message
    @message = @room.messages.new(message_params)
    # binding.pry
    # binding.pry
    if @message.save
      respond_to do |format|
        format.html{ redirect_to group_messages_path(@room), notice: 'メッセージが送信されました' }
        format.json
      end
    else
      @messages = @room.messages.includes(:member)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(member_id: current_member.id)
  end

  def set_room
    @room = Room.find(current_member.room_id)
  end

end