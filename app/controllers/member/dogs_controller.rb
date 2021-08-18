class Member::DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end
  
  def show 
    @dog = Dog.find(params[:id])
    @room = Room.find_by(foster_id: @dog.id, member_id: current_member.id)
  end 
 
end
