class MessagesController < ApplicationController
  def create
  @room = Room.find(params[:room_id])
  @message = Message.new(message_params)
  
  if member_signed_in?
    @message.is_member = true
  elsif foster_signed_in?
    @message.is_member = false
  end
  @message.room_id = @room.id
  if @message.save
    redirect_to room_url(@room)
  else
    redirect_to room_url(@room)
  end
  end 
  
  private
  def message_params
    params.require(:message).permit(:content)
  end
end
