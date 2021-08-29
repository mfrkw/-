class Member::DogsController < ApplicationController
  def index
    @dogs = Dog.All.page(params[:page]).per(8)
  end

  def search
    @dogs = Dog.All.search(params[:search]).page(params[:page]).per(8)
  end

  def show
    # find(id)で存在しない場合 -> Exception
    # find_by(id)で存在しない場合 -> nilが返ってくる
    @dog = Dog.All.find_by(id: params[:id])
    if @dog.nil?
      redirect_to foster_dogs_path, error: '存在しないidです。'
    end

    if member_signed_in?
      @foster = @dog.foster 
      @dog = Dog.All.find_by(id: params[:id])
      @room = Room.where(member_id: current_member.id).where(foster_id: @foster.id).first
      # @roomがnilかどうかで部屋判断する
    end
  end
end
