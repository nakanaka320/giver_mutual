class MessagesController < ApplicationController
  before_action :set_room

  def index
    @member = Member.new(id: :current_member)
    @message = Message.new
    @messages = @room.messages.includes(:member)

  end

  def make_message
    @message = @room.messages.new(message_params)
    if @message.save
      render :index
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
