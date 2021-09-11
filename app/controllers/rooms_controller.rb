class RoomsController < ApplicationController
  def show
      @message = Message.new
    if foster_signed_in?
      @room = Room.AllMember.find_by(id: params[:id])
    elsif member_signed_in?
      @room = Room.AllFoster.find_by(id: params[:id])
    else
      redirect_to "/"
    end

    if @room.nil?
      redirect_to index_path, error: '存在しないidです。'
      return
    end

    @messages = @room.messages # ルームのメッセージ総てを取得
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
      # memberがログインしてたらmember_idを, fosterがログインしてたらfoster_idを@roomにいれる
      @room = Room.new(foster_id: params[:foster_id])
      @room.member_id = current_member.id

    end
    if @room.save # 存在するfosterだったら保存する　&&=かつ
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

 
end
