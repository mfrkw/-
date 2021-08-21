class Foster::FostersController < ApplicationController
  before_action :authenticate_foster!

  def show
    @foster = Foster.find(params[:id])
  end

  def edit
    @foster = Foster.find(params[:id])
  end

  def update
    foster = Foster.find(current_foster.id)
    if foster.update(foster_params)
      redirect_to foster_foster_path, notice: '変更しました'
    else
      render :edit
    end
  end

  def out
    @foster = Foster.find(current_foster.id)
    @foster.update(is_deleted: true)

#    @foster.dogs.destroy
#    @foster.rooms.destroy

#    tables = Foster.reflect_on_all_associations(:has_many).map(&:name) #fosterモデルが持っているhas_manyのテーブルを取得する
    # [":dogs", ":rooms"]
#    tables.each do |table|
      # tableという変数をmodelのクラスに変換
      # ":dogs" -> "dogs" 文字列に変換(to_s)
      # classify.constantize 文字列をクラスに変換
#      model = (table.to_s.classify.constantize)
      # modelから退会したfosterが投稿や関連付けされているデータを削除
#      model.where(foster: @foster).destroy
#    end
    # ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました！またのご利用お待ちしております。"

    redirect_to root_path

  end


  private
  def foster_params
    params.require(:foster).permit(:last_name, :first_name, :telephone_number, :postal_code, :address, :email)
  end

end
