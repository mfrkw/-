class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id]) 
    @message = Message.new
    @messages = @room.messages #ルームのメッセージ総てを取得
    if member_signed_in?
      if @room.member.id == current_member.id
        @foster = @room.foster
      else
        redirect_to "/"
      end 
    elsif foster_signed_in?
      if @room.foster.id == current_foster.id
        @member = @room.member
      else
        redirect_to "/"
      end
    else  
       redirect_to "/"
    end 
  end
  
  def create
    if member_signed_in?
      #memberがログインしてたらmember_idを, fosterがログインしてたらfoster_idを@roomにいれる
      @room = Room.new(room_foster_params)
      @room.member_id = current_member.id
    elsif foster_signed_in?
      @room = Room.new(room_member_params)
      @room.foster_id = current_foster.id
    else
      redirect_to "/"
    end 
    
    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end 
  end 
  
  private
  def room_foster_params
    params.require(:room).permit(:foster_id)
  end 
  def room_member_params
    params.require(:room).permit(:member_id)
  end
end
