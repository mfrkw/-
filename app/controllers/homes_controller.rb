class HomesController < ApplicationController

  def top

    if foster_signed_in?
      @members = Member.all
      rooms = current_foster.rooms
      # 自分が入っているroomで相手のidを格納
      @member_ids =[] #ids=主キーのカラムデータを取得する
      rooms.each do |r| #roomに<<でr.foster_idを追加している
        @member_ids << r.member_id
      end
    end
  end #自分が入ってる Room の相手の情報を配列に格納することで、viewで誰とのチャットなのか見られるようにする
end
