class MessagesController < ApplicationController
  before_action :set_room

  def index
    @member = Member.new(id: :current_member)
    @message = Message.new
    @messages = @room.messages.includes(:member)
  end

  def make_message
    put "OK"
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(member_id: current_member.id)
  end

  def set_room
    @room = Room.find(current_member.room_id)
  end

end
