class Member::DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end
  
  def search
   @dogs = Dog.search(params[:search])
  end 
  
  def show 
    @dog = Dog.find(params[:id])
    # @room = Room.find_by(foster_id: @dog.id, member_id: current_member.id)
    
    if member_signed_in?
      @foster = @dog.foster     #12行目の@dogのfosterを使う
      @room = Room.where(member_id:current_member.id).where(foster_id:@foster.id).first  #@roomがnilかどうかで部屋判断する
  
    end
  end 
 
 
end
