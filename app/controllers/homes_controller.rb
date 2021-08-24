class HomesController < ApplicationController

  def top
    @dogs = Dog.All
  end

  def index

    if foster_signed_in?
    @members = Member.where(is_deleted: false)  #有効なmemberを取得
    @foster = current_foster
    @room = Room.where(member_id:@members.ids).where(foster_id:@foster.id)  #@roomがnilかどうかで部屋判断する
    end

    if member_signed_in?
    @fosters = Foster.where(is_deleted: false)
    @member = current_member
    @room = Room.where(foster_id:@fosters.ids).where(member_id:@member.id)  #@roomがnilかどうかで部屋判断する ids=主キーのカラムデータを取得する
    end
    # @room = [{id:1, name: "test"},{id:2, name: "test2"}] ["test", "test2"] [1, 2, 3]   [[1,2,3],["test","test2"]]
    #@members = [{id:1, name: },{id:2, name: },{id:3, name: }]
    
  end
end
