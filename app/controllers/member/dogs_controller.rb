class Member::DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end
  
  def show 
    @dog = Dog.find(params[:id])
    @room = Room.find_by(foster_id: @dog.id, member_id: current_member.id)
    
    if member_signed_in?
      @fosters = Foster.all
      rooms = current_member.rooms
    #   # 自分が入っているroomで相手のidを格納
      @foster_ids = [] #ids=主キーのカラムデータを取得する
      rooms.each do |r|
        # @foster_ids << r.foster_id　#roomに<<でr.foster_idを追加している
      end
    end
  end 
 
end
