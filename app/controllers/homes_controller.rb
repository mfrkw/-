class HomesController < ApplicationController

  def top
  end

  def index

    if foster_signed_in?
    @members = Member.all
    @foster = current_foster
    @room = Room.where(member_id:@members.ids).where(foster_id:@foster.id)  #@roomがnilかどうかで部屋判断する

    # @room = [{id:1, name: "test"},{id:2, name: "test2"}] ["test", "test2"] [1, 2, 3]   [[1,2,3],["test","test2"]]
    #@members = [{id:1, name: },{id:2, name: },{id:3, name: }]
    # rooms = current_foster.rooms
    # 自分が入っているroomで相手のidを格納
    # @member_ids =[] #ids=主キーのカラムデータを取得する
    # rooms.each do |r| #roomに<<でr.foster_idを追加している
    # @member_ids << r.member_id
    # end
    end
  end#自分が入ってる Room の相手の情報を配列に格納することで、viewで誰とのチャットなのか見られるようにする


end
